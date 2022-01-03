
import 'package:dio/dio.dart';

class CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));

    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));

    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method.toUpperCase()}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}");

    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));

    print("Response: ${response.data}");

    print("<-- END HTTP");

    super.onResponse(response, handler);
  }
}