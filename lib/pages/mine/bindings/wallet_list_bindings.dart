import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/wallet_list_controller.dart';

class WalletListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletListController());
  }
}