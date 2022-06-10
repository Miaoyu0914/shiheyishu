import 'package:dio/dio.dart';

import 'http_error.dart';

abstract class HttpTransformer extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(await transformer(response));
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(errorHandler(err));
  }

  Future<Response> transformer(Response response);

  HttpError errorHandler(DioError err);
}
