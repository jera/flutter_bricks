import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_host.dart';
import 'endpoint.dart';

typedef Failure = void Function(DioError error);
typedef Success = void Function(dynamic response);

class ApiProvider {
  late final Dio _dio;

  ApiProvider({Dio? dio}) {
    final baseOptions = BaseOptions(baseUrl: ApiHost.baseURL);

    _dio = dio ?? Dio(baseOptions);

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
  }

  Future<void> request({required Endpoint endpoint, Success? success, Failure? failure}) async {
    final contentTypeValue = endpoint.contentType ?? ContentType.json.value;

    final requestOptions = Options(
      method: endpoint.method,
      contentType: contentTypeValue,
      // TODO Uncomment when sessionHeaders has be implemented
      // headers: ApiHost.sessionHeaders,
    );

    try {
      final response = await _dio.request(
        endpoint.path,
        data: endpoint.data,
        options: requestOptions,
        queryParameters: endpoint.queryParameters,
      );
      success?.call(response.data);
    } on DioError catch (error) {
      failure?.call(error);
    }
  }
}
