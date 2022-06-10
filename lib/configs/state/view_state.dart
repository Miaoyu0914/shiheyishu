
/// pageCurrentStatus
enum ViewState {
  idle,
  busy, //loading
  empty, //noData
  error, //loadError
}

/// 错误类型
enum ViewStateErrorType {
  defaultError,
  networkTimeOutError, //networkError
  unauthorizedError //unAuthToken
}

class ViewStateError {
  ViewStateErrorType _errorType;
  String? message;
  String? errorMessage;

  ViewStateError(this._errorType, {this.message, this.errorMessage}) {
    _errorType = ViewStateErrorType.defaultError;
    message ??= errorMessage;
  }

  ViewStateErrorType get errorType => _errorType;

  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;
  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $_errorType, message: $message, errorMessage: $errorMessage}';
  }
}

//enum ConnectivityStatus { WiFi, Cellular, Offline }
