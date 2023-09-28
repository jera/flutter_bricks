import '../api/force_update_routes.dart';
import '../models/minimum_version.dart';

/// Alterar para `ServerError` caso necessário
typedef Failure = void Function(String error);
typedef Success = void Function(MinimumVersion minimumVersion);

abstract class GetMinimumVersionUseCaseProtocol {
  void execute({required String platform, Success? success, Failure? failure});
}

class GetMinimumVersionUseCase extends GetMinimumVersionUseCaseProtocol {
  final ForceUpdateRoutesProtocol _routes;

  // Constructor
  GetMinimumVersionUseCase({ForceUpdateRoutesProtocol? routes}) : this._routes = routes ?? ForceUpdateRoutes();

  // GetMinimumVersionUseCaseProtocol
  @override
  void execute({required String platform, Success? success, Failure? failure}) {
    _routes.getMinimumVersion(
      platform: platform,
      success: (response) {
        try {
          final minimumVersion = MinimumVersion.fromMap(response);
          success?.call(minimumVersion);
        } on Error {
          failure?.call('TODO ERROR');
        }
      },
      failure: (error) {
        failure?.call('TODO ERROR');
      },
    );
  }
}
