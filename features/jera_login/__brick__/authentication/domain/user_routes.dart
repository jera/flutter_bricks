import '../../../../../../../api/setup/api_provider.dart';
import '../../../../../../../api/setup/endpoint.dart';
import '../models/google_login_request.dart';
import '../models/user_request.dart';
import '../models/user_request_ios.dart';

abstract class UserRoutesProtocol {
  void login({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  });
  void register({
    required UserRequest user,
    Success? success,
    Failure? failure,
  });
  void enterWithGoogle({
    required GoogleLoginRequest googleRequest,
    Success? success,
    Failure? failure,
  });
  void enterWithApple({
    required UserRequestIOS session,
    required Success success,
    required Failure failure,
  });
  void enterWithFacebook({
    required String token,
    required Success success,
    required Failure failure,
  });
}

class UserRoutes extends UserRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void login({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      path: '/users/sign_in',
      method: 'POST',
      data: {
        'email': email,
        'password': password,
      },
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void register({required UserRequest user, Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/users', method: 'POST', data: user.toMap());

    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void enterWithGoogle({required GoogleLoginRequest googleRequest, Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      path: '/users/google_auth',
      method: 'POST',
      data: googleRequest.toMap(),
    );

    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }

  @override
  void enterWithApple({
    required UserRequestIOS session,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      method: 'POST',
      data: session.toMap(),
      path: '/users/apple_auth',
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void enterWithFacebook({
    required String token,
    required Success success,
    required Failure failure,
  }) {
    final endpoint = Endpoint(
      method: 'POST',
      path: '/users/facebook_auth',
      data: {'access_token': token},
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
