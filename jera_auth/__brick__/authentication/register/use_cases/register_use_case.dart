import 'package:Auth/features/authentication/models/user_request.dart';

import '../../domain/user_routes.dart';
import '../../models/user.dart';

typedef Success = void Function(User user);
typedef Failure = void Function(String error);

abstract class RegisterUseCaseProtocol {
  void execute({
    required UserRequest user,
    required Success success,
    required Failure failure,
  });
}

class RegisterUseCase extends RegisterUseCaseProtocol {
  UserRoutesProtocol routes;

  /// Init
  RegisterUseCase({required this.routes});

  /// RegisterUseCaseProtocol
  @override
  void execute({
    required UserRequest user,
    required Success success,
    required Failure failure,
  }) {
    routes.register(
      user: user,
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
