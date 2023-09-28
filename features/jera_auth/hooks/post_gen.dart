import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  /// brick vars
  final hasSocial = context.vars['has_social'];
  final hasApple = context.vars['has_apple'];
  final hasGoogle = context.vars['has_google'];
  final hasFacebook = context.vars['has_facebook'];

  if (hasSocial) {
    final progressFlutterSvg = context.logger.progress('Installing package flutter_svg');
    await Process.run('flutter', ['pub', 'add', 'flutter_svg'], runInShell: true);
    progressFlutterSvg.complete();

    if (hasFacebook) {
      final progressFacebook = context.logger.progress('Installing package flutter_facebook_auth');
      await Process.run('flutter', ['pub', 'add', 'flutter_facebook_auth'], runInShell: true);
      progressFacebook.complete();
    }
    if (hasGoogle) {
      final progressGoogle = context.logger.progress('Installing package google_sign_in');
      await Process.run('flutter', ['pub', 'add', 'google_sign_in'], runInShell: true);
      progressGoogle.complete();

      final progressFirebaseAuth = context.logger.progress('Installing package firebase_auth');
      await Process.run('flutter', ['pub', 'add', 'firebase_auth'], runInShell: true);
      progressFirebaseAuth.complete();
    }
    if (hasApple) {
      final progressApple = context.logger.progress('Installing package sign_in_with_apple');
      await Process.run('flutter', ['pub', 'add', 'sign_in_with_apple'], runInShell: true);
      progressApple.complete();

      final progressCrypto = context.logger.progress('Installing package crypto');
      await Process.run('flutter', ['pub', 'add', 'crypto'], runInShell: true);
      progressCrypto.complete();
    }
  }

  final progressSecureStorage = context.logger.progress('Installing package flutter_secure_storage');
  await Process.run('flutter', ['pub', 'add', 'flutter_secure_storage'], runInShell: true);
  progressSecureStorage.complete();

  context.logger.info('Brick JERAda com sucesso!');
}
