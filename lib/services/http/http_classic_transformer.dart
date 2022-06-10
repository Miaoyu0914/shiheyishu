import 'package:dio/dio.dart';

import 'http_error.dart';
import 'http_transformer.dart';

/// Classic response transformer
///
/// The following structures can be processed:
/// ```
/// {
///   code: <int>,
///   message: <String>,
///   data: <AnyType>
/// }
/// ```
///
/// Example:
/// ```
/// var http = Http.getInstances(HttpBaseOptions({
///   name: 'defaultApi',
///   baseUrl: 'http://domain.com/api/v1',
///   transformer: HttpClassicTransformer(
///     codeKey: 'code',
///     messageKey: 'message',
///     dataKey: 'data',
///   ),
/// }));
/// var res = await http.get('/users');
/// print(res.data); // "res.data" is "response.data[dataKey]" for Dio
/// ```
///
/// If you want to get the raw data, please use the "isRaw" parameter:
/// ```
/// var res = await http.get('/download/music.mp3', HttpOptions(
///   extra: {'isRaw': true}
/// ));
/// print(res.data); // "res.data" in "response.data" for Dio
/// ```
///
/// [HttpError] will be thrown when an error occurs.
///
class HttpClassicTransformer extends HttpTransformer {
  final int successCode;
  final String codeKey;
  final String messageKey;
  final String dataKey;

  HttpClassicTransformer({
    this.successCode = 0,
    this.codeKey = 'code',
    this.messageKey = 'message',
    this.dataKey = 'data',
  });

  @override
  Future<Response> transformer(Response response) async {
    if (response.requestOptions.extra.containsKey('isRaw') &&
        response.requestOptions.extra['isRaw'] is bool &&
        response.requestOptions.extra['isRaw'] == true) {
      return response;
    }

    // Response body structural error
    if (!(response.data is Map)) {
      throw 'Response body is not an map.';
    }
    if (!(response.data as Map).containsKey(codeKey)) {
      throw 'The `$codeKey` key does not exist in response body.';
    }
    if (!(response.data[codeKey] is int)) {
      throw 'The `$codeKey` key in the response body is not an [int] type.';
    }

    // Response returns error
    if (response.data[codeKey] != successCode) {
      throw response.data[messageKey] ?? 'unknown error';
    }

    response.data = response.data[dataKey] ?? null;

    return response;
  }

  @override
  HttpError errorHandler(DioError err) {
    int statusCode = err.response?.statusCode ?? 0;

    // classic error format
    // {
    //    "code": int,
    //    "message": "Message string",
    //    "data": <AnyType>
    // }
    if (err.response?.data is Map<String, dynamic> &&
        (err.response!.data as Map).containsKey(codeKey) &&
        (err.response!.data as Map)[codeKey] is int &&
        ((err.response!.data as Map)[codeKey] as int) != successCode) {
      return HttpError(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: err.error,
        statusCode: statusCode,
        errorCode: (err.response!.data as Map)[codeKey].toString(),
        errorMessage:
            (err.response!.data as Map)[messageKey]?.toString() ?? null,
        errorData: (err.response!.data as Map)[dataKey] ??
            (err.response!.data as Map)[dataKey],
      );
    }

    // other format
    return HttpError(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: err.error,
      statusCode: statusCode,
      errorCode: HttpErrorCode.unknownError,
      errorMessage: null,
      errorData: err.response?.data,
    );
  }
}
