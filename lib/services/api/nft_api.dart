import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as api_get;
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/storage_manager.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http.dart';
import 'package:shiheyishu/services/http/http_base_options.dart';
import 'package:shiheyishu/services/http/http_standard_transformer.dart';
import 'api.dart';

Http? _http;

Http get nftApi {
  _http ??= Http.getInstances(HttpBaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      name: 'nft',
      baseUrl: Constant.host,
      transformer: HttpStandardTransformer(),
      headers: {
        "token": Constant.TOKENVALUE,
      }));
  _http!.interceptors.clear();
  _http!.interceptors.add(_Interceptor());
  return _http!;
}

class _Interceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    print("head：${options.headers.toString()}");
    print('defaultApi.onRequest: ${options.baseUrl}${options.path} queryParameters: ${options.queryParameters}' + ' data:${options.data}');

    // return options;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print('defaultApi.onResponse: ${response.data}');
    if(response.data["code"] == 0){
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      EasyLoading.showError(response.data["msg"],);
    }else if(response.data["code"] == -1){
      StorageManager.clearAll();
      api_get.Get.offAllNamed(Routes.LOGIN);
    }else{
      DefaultResponseData respData = DefaultResponseData.fromJson(response.data);
      response.data = respData.data;
      super.onResponse(response, handler);
    }

    // String message = "";
    // if (respData.messageId != null) {
    //   if (respData.messageId!.tr != respData.messageId) {
    //     message = respData.messageId!.tr;
    //   }
    // } else if (respData.message != null) {
    //   if (respData.message!.tr != respData.message) {
    //     message = respData.message!.tr;
    //   }
    // }
    // if (!respData.success && message.length > 0) {
    //   showDialog(
    //       context: myGet.Get.context!,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           content: SingleChildScrollView(
    //             child: ListBody(
    //               children: <Widget>[
    //                 Text(message),
    //               ],
    //             ),
    //           ),
    //           actionsAlignment: MainAxisAlignment.center,
    //           actions: <Widget>[
    //             TextButton(
    //               child: Text('common.sure'.tr),
    //               onPressed: () {
    //                 myGet.Get.back();
    //               },
    //             ),
    //           ],
    //         );
    //       });
    //   EasyLoading.dismiss();
    //   return;
    // }
  }
}

class DefaultResponseData extends BaseResponseData {
  bool get success => 1 == code;

  DefaultResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['msg'];
    data = json['data'];
  }
}
