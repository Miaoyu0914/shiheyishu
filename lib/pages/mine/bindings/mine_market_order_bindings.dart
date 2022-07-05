import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_market_order_controller.dart';

class MineMarketOrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineMarketOrderController());
  }
}