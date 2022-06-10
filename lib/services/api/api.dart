import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

export 'package:dio/dio.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    init();
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.badCertificateCallback=(cert, host, port){
        return true;
      };
    };
  }

  void init();
}

abstract class BaseResponseData {
  int? code = 0;
  String? message;
  dynamic data;
  String? messageId;

  bool get success;

  BaseResponseData({this.code, this.message, this.data, this.messageId});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data, messageId: $messageId}';
  }
}

class NotSuccessException implements Exception {
  String? message;
  String? messageId;

  NotSuccessException.fromRespData(BaseResponseData respData) {
    message = respData.message;
    messageId = respData.messageId;
  }

  @override
  String toString() {
    return 'NotSuccessException{respData: $message}';
  }
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}