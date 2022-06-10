import 'http_cancel_token.dart';

mixin HttpSmartCancel {
  final Map<String, HttpCancelToken> _cancelTokens = {};

  HttpCancelToken getCancelToken(
      {String name = 'default', bool destroyPrevious = true}) {
    if (destroyPrevious) {
      _cancelHttpRequest(name);
    }

    return _cancelTokens[name] ??= HttpCancelToken();
  }

  void cancelHttpRequest({String? name}) {
    if (name != null) {
      _cancelHttpRequest(name);
    } else {
      _cancelTokens.keys.forEach((name) {
        _cancelHttpRequest(name);
      });
    }
  }

  void _cancelHttpRequest(String name) {
    if (_cancelTokens.containsKey(name)) {
      if (!_cancelTokens[name]!.isCancelled) {
        _cancelTokens[name]!.cancel();
      }
      _cancelTokens.remove(name);
    }
  }
}
