import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shiheyishu/configs/log.dart';

import 'http_base_options.dart';

export 'package:dio/src/dio.dart';

_parseAndDecode(String responseBody) {
  return jsonDecode(responseBody);
}

/// Http library, secondary packaging based on "dio/dio".
///
/// Get http singleton instance by `name` param.
/// ```
/// var http = Http.getInstances(HttpBaseOptions({
///   name: 'defaultApi',
///   baseUrl: 'http://domain.com/api/v1',
/// }));
/// var res = await http.get('/users');
/// print(res.data);
/// ```
class Http with DioMixin implements Dio {
  static bool isLogEnable = false;
  static bool isFullLogEnable = false;

  static Map<String, Http> _instances = {};
  static Http getInstances(HttpBaseOptions options) {
    if (!_instances.containsKey(options.name)) {
      _instances[options.name] = Http._instance(options);
    }

    return _instances[options.name]!;
  }

  Http._instance(HttpBaseOptions options) : super() {
    this.options = options;

    (this.transformer as DefaultTransformer).jsonDecodeCallback =
        (String responseBody) {
      return compute(_parseAndDecode, responseBody);
    };

    if (options.transformer != null) {
      interceptors.add(options.transformer!);
    }

    if (isLogEnable || isFullLogEnable) {
      interceptors.add(LogInterceptor(
        error: false,
        responseBody: isFullLogEnable,
        logPrint: (Object object) {
          Log.info(object);
        },
      ));
    }

    httpClientAdapter = DefaultHttpClientAdapter();

    if (options.proxy?.isNotEmpty ?? false) {
      (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY ${options.proxy}";
        };
      };
    }
  }
}
