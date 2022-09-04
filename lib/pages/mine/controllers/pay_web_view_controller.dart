import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/pages/mine/controllers/wallet_controller.dart';

class PayWebViewController extends ViewStateController {
  // ignore: prefer_typing_uninitialized_variables
  var url;
  final walletController = Get.find<WalletController>();

  PayWebViewController({this.url});
  @override
  void onInit() {
    super.onInit();

  }

  void getBack() {
    walletController.getUserInfo();
    walletController.getWalletList();
    Get.back();
  }

}