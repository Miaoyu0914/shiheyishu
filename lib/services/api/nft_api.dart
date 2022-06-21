import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as api_get;
import 'package:shiheyishu/configs/constant.dart';
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
        // "token": accessToken,
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
    print('defaultApi.onRequest: ${options.baseUrl}${options.path}' + ' queryParameters: ${options.queryParameters}' + ' data:${options.data}');

    // return options;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print('defaultApi.onResponse: ${response.data}');

    DefaultResponseData respData = DefaultResponseData.fromJson(response.data);
    if(respData.code == 0){
      EasyLoading.showError(respData.message!);
    }else if(respData.code == -1){
      api_get.Get.toNamed(Routes.LOGIN);
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
    response.data = respData.data;
    super.onResponse(response, handler);
  }
}

class DefaultResponseData extends BaseResponseData {
  bool get success => 1 == code;

  DefaultResponseData.fromJson(Map<String, dynamic> json) {
    code = int.parse(json['code']);
    message = json['msg'];
    data = json['data'];
  }
}
