import '../../../../../../../api/setup/api_provider.dart';
import '../../../../../../../api/setup/endpoint.dart';
import '../models/register_request.dart';

abstract class RegisterRoutesProtocol {
  void register({
    required RegisterRequest registerRequest,
    Success? success,
    Failure? failure,
  });
}

class RegisterRoutes extends RegisterRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void register({required RegisterRequest registerRequest, Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/users', method: 'POST', data: user.toMap());

    _provider.request(success: success, failure: failure, endpoint: endpoint);
  }
}
