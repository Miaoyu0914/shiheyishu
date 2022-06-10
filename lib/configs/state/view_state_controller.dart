

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state.dart';

import '../../services/api/api.dart';

class ViewStateController extends GetxController {
  bool disposed = false;

  ViewState? _viewState;

  ViewStateController({ViewState? viewState})
      : _viewState = viewState ?? ViewState.idle {
    debugPrint('ViewStateController---constructor--->$runtimeType');
  }

  /// ViewState
  ViewState? get viewState => _viewState;

  set viewState(ViewState? viewState) {
    _viewStateError = null;
    _viewState = viewState;
    update();
  }

  /// ViewStateError
  ///
  ViewStateError? _viewStateError;

  ViewStateError? get viewStateError => _viewStateError;

  ///
  /// get
  bool get isBusy => viewState == ViewState.busy;

  bool get isIdle => viewState == ViewState.idle;

  bool get isEmpty => viewState == ViewState.empty;

  bool get isError => viewState == ViewState.error;

  /// set
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setError(e, stackTrace, {String? message}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;
    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        // timeout
        errorType = ViewStateErrorType.networkTimeOutError;
        message = e.message;
      } else if (e.type == DioErrorType.response) {
        // incorrect status, such as 404, 503...
        message = e.error;
      } else if (e.type == DioErrorType.cancel) {
        // to be continue...
        message = e.error;
      } else {
        e = e.error;
        if (e is UnAuthorizedException) {
          stackTrace = null;
          errorType = ViewStateErrorType.unauthorizedError;
        } else if (e is NotSuccessException) {
          stackTrace = null;
          message = e.message;
        } else if (e is SocketException) {
          errorType = ViewStateErrorType.networkTimeOutError;
          message = e.message;
        } else {
          message = e.message;
        }
      }
    }
    viewState = ViewState.error;
    _viewStateError = ViewStateError(
      errorType,
      message: message,
      errorMessage: e.toString(),
    );
    printErrorStack(e, stackTrace);
    onError(viewStateError!);
  }

  void onError(ViewStateError viewStateError) {}

  /// showErrorMssage
  // showErrorMessage(context, {String? message}) {
  //   if (viewStateError != null || message != null) {
  //     if (viewStateError.isNetworkTimeOut) {
  //       message ??= "common.network_error".tr;
  //     } else {
  //       message ??= viewStateError.message;
  //     }
  //     Future.microtask(() {
  //       EasyLoading.showToast(message.toString());
  //     });
  //   }
  // }

  @override
  String toString() {
    return 'BaseModel{_viewState: $viewState, _viewStateError: $_viewStateError}';
  }

  @override
  void dispose() {
    disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }
}

/// [e]Error Type :May Be Error , Exception ,String
/// [s]Stack information
printErrorStack(e, s) {
  debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}
