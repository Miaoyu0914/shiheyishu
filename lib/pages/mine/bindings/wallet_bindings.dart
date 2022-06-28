 import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/wallet_controller.dart';

 class WalletBindings extends Bindings {
   @override
   void dependencies() {
     Get.lazyPut(() => WalletController());
   }
 }