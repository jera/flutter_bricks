import '../../domain/user_routes.dart';
import '../../models/user.dart';

typedef Success = void Function(User user);
typedef Failure = void Function(String error);

abstract class LoginUseCaseProtocol {
  void execute({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  });
}

class LoginUseCase extends LoginUseCaseProtocol {
  UserRoutesProtocol routes;

  /// Init
  LoginUseCase({required this.routes});

  /// LoginUseCaseProtocol
  @override
  void execute({
    required String email,
    required String password,
    required Success success,
    required Failure failure,
  }) {
    routes.login(
      email: email,
      password: password,
      success: (response) {
        try {
          final user = User.fromMap(response);
          success.call(user);
        } on Error catch (error) {
          failure.call(error.toString());
        }
      },
      failure: (error) {
        failure.call(error.message ?? '');
      },
    );
  }
}
