import 'package:dio/dio.dart';

import 'http_transformer.dart';

class HttpBaseOptions extends BaseOptions {
  final String name;
  final HttpTransformer? transformer;
  final String? proxy;

  HttpBaseOptions({
    String? method,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    String baseUrl = '',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool setRequestContentTypeWhenNoPayload = false,
    required this.name,
    this.transformer,
    this.proxy,
  }) : super(
            method: method,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            baseUrl: baseUrl,
            queryParameters: queryParameters,
            extra: queryParameters,
            headers: headers,
            responseType: responseType,
            contentType: contentType,
            validateStatus: validateStatus,
            receiveDataWhenStatusError: receiveDataWhenStatusError,
            followRedirects: followRedirects,
            maxRedirects: maxRedirects,
            requestEncoder: requestEncoder,
            responseDecoder: responseDecoder,
            listFormat: listFormat,
            setRequestContentTypeWhenNoPayload:
                setRequestContentTypeWhenNoPayload);

  HttpBaseOptions copyWith({
    String? method,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    String? path,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool? setRequestContentTypeWhenNoPayload,
    String? name,
    HttpTransformer? transformer,
    String? proxy,
  }) {
    Map<String, dynamic> hs;
    if (contentType != null) {
      if (headers != null) {
        hs = headers..remove(Headers.contentTypeHeader);
      } else {
        hs = Map.from(this.headers)..remove(Headers.contentTypeHeader);
      }
    } else {
      if (headers != null) {
        if (headers.containsKey(Headers.contentTypeHeader)) {
          contentType = headers[Headers.contentTypeHeader];
        } else if (this.contentType != null) {
          contentType = this.contentType;
        } else if (this.headers.containsKey(Headers.contentTypeHeader)) {
          contentType = this.headers[Headers.contentTypeHeader];
        }
        hs = headers..remove(Headers.contentTypeHeader);
      } else {
        if (this.contentType != null) {
          contentType = this.contentType;
        } else if (this.headers.containsKey(Headers.contentTypeHeader)) {
          contentType = this.headers[Headers.contentTypeHeader];
        }
        hs = Map.from(this.headers)..remove(Headers.contentTypeHeader);
      }
    }

    return HttpBaseOptions(
      method: method ?? this.method,
      baseUrl: baseUrl ?? this.baseUrl,
      queryParameters: queryParameters ?? this.queryParameters,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      extra: extra ?? Map.from(this.extra),
      headers: hs,
      responseType: responseType ?? this.responseType,
      contentType: contentType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat,
      setRequestContentTypeWhenNoPayload: setRequestContentTypeWhenNoPayload ??
          this.setRequestContentTypeWhenNoPayload,
      name: name ?? this.name,
      transformer: transformer ?? this.transformer,
      proxy: proxy ?? this.proxy,
    );
  }
}
