import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/market_rank_controller.dart';

class MarketRankBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketRankController());
  }
}