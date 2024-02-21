abstract class UserRoutesProtocol {
  void recoverPassword({
    required String email,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  });
}

class UserRoutes extends UserRoutesProtocol {
  final ApiProvider _provider = ServiceLocator.get<ApiProvider>();

  @override
  void recoverPassword({
    required String email,
    Success? success,
    Failure? failure,
    VoidCallback? onComplete,
  }) {
    final endpoint = Endpoint(
      path: '/users/recover_password', // TODO: Alterar se necessário
      method: 'POST',
      data: {'email': email},
    );

    _provider.request(
      endpoint: endpoint,
      success: success,
      failure: failure,
      onComplete: onComplete,
    );
  }
}
