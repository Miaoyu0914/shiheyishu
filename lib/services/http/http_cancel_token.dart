import 'package:dio/dio.dart';

/// Cancle token
///
/// ```
/// var http = Http.getInstances(HttpBaseOptions({
///   name: 'defaultApi',
///   baseUrl: 'http://domain.com/api/v1',
/// }));
/// var cancelToken = HttpCancelToken();
/// try {
///   var httpGet = http.get('/users', cancelToken: cancelToken);
///   Future.delayed(Duration(milliseconds: 100), () {
///     cancelToken.cancel();
///   });
///   await httpGet;
/// } on HttpError catch (e) {
///   if (HttpError.type == HttpErrorType.cancel) {
///     print('Has been canceled!');
///   }
///   throw e;
/// }
/// ```
class HttpCancelToken extends CancelToken {}
