import 'dart:async';

import 'package:get/get.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';

import '../../../configs/storage_manager.dart';

class SplashController extends ViewStateController {
  int countNumber = 3;
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startCount();
  }

  Future<void> startCount() async {
    await StorageManager.init();
    Constant.getToken();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if(countNumber <= 0){
        _timer?.cancel();
        await pushToNextPage();
        update();
      }else{
        countNumber -= 1;
        update();
      }
    });
  }

  Future<void> endCount() async {
    _timer?.cancel();
    countNumber = 0;
    await pushToNextPage();
    update();
  }

  Future<void> pushToNextPage()  async {
    if(Constant.TOKENVALUE == ""){
      //loginPage
      Get.offAndToNamed(Routes.NAV);
    }else{
      //tabPage
      Get.offAndToNamed(Routes.NAV);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}