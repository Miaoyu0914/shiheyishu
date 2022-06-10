import 'package:dio/dio.dart';
import 'package:shiheyishu/configs/utils.dart';

class HttpError extends DioError {
  final int statusCode;
  final String errorCode;
  final String? errorMessage;
  final dynamic errorData;
  late final HttpErrorType errorType;

  HttpError({
    required this.statusCode,
    required this.errorCode,
    this.errorMessage,
    this.errorData,
    required requestOptions,
    response,
    type = DioErrorType.other,
    error,
  }) : super(
          requestOptions: requestOptions,
          response: response,
          type: type,
          error: error,
        ) {
    errorType = enumFromString(HttpErrorType.values, enumToString(type));
  }

  @override
  String toString() {
    var msg =
        'HttpError(${type.toString().replaceAll('DioErrorType.', '')} $statusCode) [$errorCode]: ${errorMessage ?? message}';
    if (stackTrace != null) {
      msg += '\n$stackTrace';
    }
    return msg;
  }
}

enum HttpErrorType {
  /// It occurs when url is opened timeout.
  connectTimeout,

  /// It occurs when url is sent timeout.
  sendTimeout,

  ///It occurs when receiving timeout.
  receiveTimeout,

  /// When the server response, but with a incorrect status, such as 404, 503...
  response,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// Default error type, Some other Error. In this case, you can
  /// use the DioError.error if it is not null.
  other,
}

class HttpErrorCode {
  static final String paramaterInvalid = 'ParamaterInvalid';
  static final String unauthorized = 'Unauthorized';
  static final String accountPasswordInvalid = 'AccountPasswordInvalid';
  static final String accountLocked = 'AccountLocked';
  static final String accountOffline = 'AccountOffline';
  static final String forbidden = 'Forbidden';
  static final String existing = 'Existing';
  static final String notFound = 'NotFound';
  static final String methodNotAllowed = 'MethodNotAllowed';
  static final String serverError = 'ServerError';
  static final String structureError = 'StructureError';
  static final String unknownError = 'UnknownError';

  static final Map<String, int> _errorCodeToStatusCodes = {
    paramaterInvalid: 422,
    unauthorized: 401,
    accountPasswordInvalid: 401,
    accountLocked: 401,
    accountOffline: 401,
    forbidden: 403,
    existing: 403,
    notFound: 404,
    methodNotAllowed: 405,
    serverError: 500,
    unknownError: 0,
  };

  static int getStatusCode(String errorCode) {
    return _errorCodeToStatusCodes[errorCode] ??
        _errorCodeToStatusCodes[unknownError]!;
  }
}
