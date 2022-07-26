import 'package:get/get.dart';
import 'package:shiheyishu/pages/blind_box/controllers/blind_box_controller.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';
import 'package:shiheyishu/pages/market/controllers/market_controller.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_controller.dart';
import 'package:shiheyishu/pages/public_pool/controllers/public_pool_controller.dart';
import 'package:shiheyishu/pages/nav/controllers/nav_bar_controller.dart';

class NavBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavBarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BlindBoxController());
    Get.lazyPut(() => PublicPoolController());
    Get.lazyPut(() => MarketController());
    Get.lazyPut(() => MineController());
  }
}