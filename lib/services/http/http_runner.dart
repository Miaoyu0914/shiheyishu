import 'package:dio/dio.dart';

import 'http_error.dart';
import 'http_runner_params.dart';

typedef HttpRunner<T> = Future<T?> Function(HttpRunnerParams params);
typedef HttpRunnerAction<T> = Future<T> Function(HttpRunnerParams params);

/// Create API functions with perfect error handling.
///
/// ```
/// var http = Http.getInstances(HttpBaseOptions({
///   name: 'defaultApi',
///   baseUrl: 'http://domain.com/api/v1',
/// }));
///
/// class UserApi {
///   static final getUser = buildHttpRunner<UserEntity>((HttpRunnerParams params) async {
///     var res = await http.get('/user/${params.params?['id']??1}',
///       queryParameters: {
///         'getFullData': params.params?['getFullData'] ?? '0',
///       },
///       cancelToken: params.cancelToken);
///
///     return UserEntity.fromJson(res.data);
///   });
/// }
///
/// try {
///   var user = await UserApi.getUser(HttpRunnerParams(
///     params: {'id': 123, 'getFullData': 1},
///   ));
///   if (user == null) {
///     print('Request cancelled!');
///   }
/// } on HttpError catch (e) {
///   if (e.errorCode == HttpErrorCode.notFound) {
///     print('The user could not be found');
///   }
/// }
/// ```
HttpRunner<T> buildHttpRunner<T>(HttpRunnerAction<T> action) {
  return (HttpRunnerParams params) async {
    try {
      return await action(params);
    } on HttpError catch (e) {
      throw e;
    } on DioError catch (e) {
      if (e.type == DioErrorType.cancel) {
        return null;
      }

      int statusCode = e.response?.statusCode ?? 0;
      throw HttpError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
        statusCode: statusCode,
        errorCode: HttpErrorCode.unknownError,
        errorMessage: null,
        errorData: e.response?.data,
      );
    }
  };
}
