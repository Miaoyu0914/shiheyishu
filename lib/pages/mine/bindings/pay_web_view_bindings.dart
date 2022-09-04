import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/pay_web_view_controller.dart';

class PayWebViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayWebViewController(url: Get.arguments['url']));
  }
}