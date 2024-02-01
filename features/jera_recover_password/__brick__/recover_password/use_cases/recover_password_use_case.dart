typedef Success = VoidCallback;
typedef Failure = void Function(String error); // ServerError se houver

abstract class RecoverPasswordUseCaseProtocol {
  void execute({Success? success, Failure? failure, VoidCallback? onComplete});
}

class RecoverPasswordUseCase extends RecoverPasswordUseCaseProtocol {
  final UserRoutesProtocol routes;

  RecoverPasswordUseCase({required this.routes});

  @override
  void execute({Success? success, Failure? failure, VoidCallback? onComplete}) {
    routes.recoverPassword(
      success: () {
        // TODO: Mapear resposta se necessário
        success?.call();
      },
      failure: (error) {
        failure?.call(error.toString()); // .asServerError se houver ServerError
      },
    );
  }
}
