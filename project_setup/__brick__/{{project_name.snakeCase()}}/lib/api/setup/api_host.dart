import 'package:flutter/foundation.dart';

class ApiHost {
  ApiHost._();

  static String get versionPath => 'v1';

  static String get baseApiPath {
    if (kDebugMode) return 'staging.api.com.br/api';
    return 'production.api.com.br/api';
  }

  static String get baseURL => 'https://$baseApiPath/$versionPath';

  // TODO Implemented when sessionManager has be implemented
  // static Map<String, dynamic> get sessionHeaders {
  //   final email = SessionManager.instance.user?.email;
  //   final token = SessionManager.instance.user?.token;

  //   if (token == null || email == null) return {};

  //   return <String, String>{'USER_EMAIL': email, 'USER_TOKEN': token};
  // }
}
