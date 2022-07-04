import 'package:get/get.dart';
import 'package:shiheyishu/pages/market/controllers/market_detail_controller.dart';

class MarketDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketDetailController(id: Get.arguments['id']));
  }
}