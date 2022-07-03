import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/share_rank_controller.dart';

class ShareRankBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareRankController());
  }
}