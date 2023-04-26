import '../../../../api/setup/api_provider.dart';
import '../../../../api/setup/endpoint.dart';

abstract class ForceUpdateRoutesProtocol {
  void getMinimumVersion({required String platform, Success? success, Failure? failure});
}

class ForceUpdateRoutes extends ForceUpdateRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getMinimumVersion({required String platform, Success? success, Failure? failure}) {
    final endpoint = Endpoint(
      method: 'GET',
      path: '/minimum_versions',
      queryParameters: {'platform': platform},
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
