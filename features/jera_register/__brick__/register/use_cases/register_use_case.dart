import '../../models/user.dart';
import '../domain/register_routes.dart';
import '../models/register_request.dart';

typedef Success = void Function(User user);
typedef Failure = void Function(String error);

abstract class RegisterUseCaseProtocol {
  void execute({
    required RegisterRequest register,
    required Success success,
    required Failure failure,
  });
}

class RegisterUseCase extends RegisterUseCaseProtocol {
  RegisterRoutesProtocol routes;

  /// Init
  RegisterUseCase({required this.routes});

  /// RegisterUseCaseProtocol
  @override
  void execute({
    required RegisterRequest register,
    required Success success,
    required Failure failure,
  }) {
    routes.register(
      user: register,
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
