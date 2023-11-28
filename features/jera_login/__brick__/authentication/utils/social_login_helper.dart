import 'dart:io';

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/google_login_request.dart';
import '../models/user_request_ios.dart';

typedef VoidCallback = void Function();
typedef StringCallback = void Function(String);
typedef SessionCallback = void Function(UserRequestIOS);
typedef GoogleSessionCallback = void Function(GoogleLoginRequest googleLoginRequest);

abstract class SocialLoginHelperProtocol { 
  void enterWithFacebook({
    required StringCallback? onFailed,
    required VoidCallback? onCanceled,
    required StringCallback? onSucceeded,
  });
  void enterWithGoogle({
    StringCallback? onFailed,
    GoogleSessionCallback? onSucceeded,
    VoidCallback? onCanceled,
  });
  void enterWithApple({
    StringCallback? onFailed,
    SessionCallback? onSucceeded,
    VoidCallback? onCanceled,
  });
}

class SocialLoginHelper extends SocialLoginHelperProtocol { 
  @override
  void enterWithFacebook({StringCallback? onFailed, VoidCallback? onCanceled, StringCallback? onSucceeded}) {
    FacebookAuth.instance.login(permissions: ['email', 'public_profile']).then((facebookUser) {
      switch (facebookUser.status) {
        case LoginStatus.cancelled:
          return onCanceled?.call();
        case LoginStatus.failed:
          return onFailed?.call('Erro no facebook login');
        case LoginStatus.success:
          final accessToken = facebookUser.accessToken?.token ?? '';
          return onSucceeded?.call(accessToken);
        default:
      }
    });
  }

  @override
  void enterWithGoogle({StringCallback? onFailed, GoogleSessionCallback? onSucceeded, VoidCallback? onCanceled}) {
    GoogleSignIn().signIn().then((googleUser) {
      _handleGoogleUser(googleUser, onSucceeded, onCanceled);
    }).catchError((_) {
      _handleGoogleSignInError(onFailed);
    });
  }
  void _handleGoogleUser(
    GoogleSignInAccount? googleUser,
    GoogleSessionCallback? onSucceeded,
    VoidCallback? onCanceled,
  ) {
    if (googleUser == null) return onCanceled?.call();

    googleUser.authentication.then((googleAuth) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      _handleGoogleCredential(credential, onSucceeded);
    });
  }

  void _handleGoogleCredential(
    OAuthCredential credential,
    GoogleSessionCallback? onSucceeded,
  ) {
    FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      final accessToken = user.credential?.accessToken;
      final googleLoginRequest = GoogleLoginRequest(
        oauth2Token: accessToken ?? '',
        platform: Platform.isAndroid ? 'web' : 'ios',
      );

      onSucceeded?.call(googleLoginRequest);
    });
  }

  void _handleGoogleSignInError(StringCallback? onFailed) {
    onFailed?.call('Erro no google login');
  } 

  @override
  void enterWithApple({StringCallback? onFailed, SessionCallback? onSucceeded, VoidCallback? onCanceled}) {
    final rawNonce = _generateAppleNonce();
    final nonce = _generateAppleSha256(rawNonce);
    final scopes = [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName];

    SignInWithApple.getAppleIDCredential(
      nonce: nonce,
      scopes: scopes,
    ).then(
      (credential) => onSucceeded?.call(_getUserSession(credential)),
      onError: (exception) => _onErrorAppleSignIn(exception.code, onCanceled, onFailed),
    );
  }

  
  UserRequestIOS _getUserSession(AuthorizationCredentialAppleID credential) {
    return UserRequestIOS(
      givenName: credential.givenName ?? '',
      familyName: credential.familyName ?? '',
      appleToken: credential.identityToken ?? '',
    );
  }

  void _onErrorAppleSignIn(dynamic code, VoidCallback? onCanceled, StringCallback? onFailed) {
    if (code == AuthorizationErrorCode.canceled) {
      return onCanceled?.call();
    }
    return onFailed?.call('Erro no login com a apple');
  }

  static String _generateAppleNonce([int length = 32]) {
    final random = Random.secure();
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String _generateAppleSha256(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);

    return digest.toString();
  } 
}
