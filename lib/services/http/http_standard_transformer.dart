import 'package:dio/dio.dart';

import 'http_error.dart';
import 'http_transformer.dart';

/// Standard response transformer
///
/// REST-Api directly returns the data structure,
/// not package like [HttpClassicTransformer].
/// ```
/// var http = Http.getInstances(HttpBaseOptions({
///   name: 'defaultApi',
///   baseUrl: 'http://domain.com/api/v1',
///   transformer: HttpStandardTransformer(
///     errorCodeKey: 'code',
///     errorMessageKey: 'message',
///     errorDataKey: 'data',
///   ),
/// }));
/// var res = await http.get('/users');
/// print(res.data); // "res.data" in "response.data" for Dio
/// ```
///
/// Using the HTTP statuscode to determine if an error has occurred,
/// the error is structured as follows:
/// ```
/// {
///   code: <int>,
///   message: <String>,
///   data: <AnyType>
/// }
/// ```
///
/// [HttpError] will be thrown when an error occurs.
class HttpStandardTransformer extends HttpTransformer {
  final String errorCodeKey;
  final String errorMessageKey;
  final String errorDataKey;

  HttpStandardTransformer({
    this.errorCodeKey = 'code',
    this.errorMessageKey = 'message',
    this.errorDataKey = 'data',
  });

  @override
  Future<Response> transformer(Response response) async {
    return response;
  }

  @override
  HttpError errorHandler(DioError err) {
    int statusCode = err.response?.statusCode ?? 0;

    // standard error format
    // {
    //    "code": "Code string",
    //    "message": "Message string",
    //    "data": <AnyType>
    // }
    if (err.response?.data is Map<String, dynamic> &&
        (err.response!.data as Map).containsKey(errorCodeKey) &&
        (err.response!.data as Map)[errorCodeKey] is String &&
        ((err.response!.data as Map)[errorCodeKey] as String).isNotEmpty) {
      return HttpError(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: err.error,
        statusCode: statusCode,
        errorCode: (err.response!.data as Map)[errorCodeKey],
        errorMessage:
            (err.response!.data as Map)[errorMessageKey]?.toString() ?? null,
        errorData: (err.response!.data as Map)[errorDataKey] ??
            (err.response!.data as Map)[errorDataKey],
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
