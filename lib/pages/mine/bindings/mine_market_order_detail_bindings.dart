import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_market_order_detail_controller.dart';

class MineMarketOrderDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineMarketOrderDetailController(data: Get.arguments['data']));
  }
}