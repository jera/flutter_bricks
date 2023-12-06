class Endpoint {
  String path;
  dynamic data;
  String method;
  String? contentType;
  Map<String, String>? queryParameters;

  Endpoint({
    this.data,
    this.contentType,
    this.queryParameters,
    required this.path,
    required this.method,
  });
}
