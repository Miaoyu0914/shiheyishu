import 'package:dio/dio.dart';

import 'http_cancel_token.dart';

typedef HttpParams = Map<String, dynamic>;

class HttpRunnerParams {
  final HttpParams? params;
  final HttpParams? query;
  final HttpParams? data;
  final HttpCancelToken? cancelToken;
  final Options? options;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;

  HttpRunnerParams({
    this.params,
    this.query,
    this.data,
    this.cancelToken,
    this.options,
    this.onSendProgress,
    this.onReceiveProgress,
  });
}
