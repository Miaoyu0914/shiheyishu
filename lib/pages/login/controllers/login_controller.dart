import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/storage_manager.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_error.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class LoginController extends ViewStateController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pswController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print('login');
  }

  Future<void> login() async {
    if(CommonUtils.isPhoneNumber(phoneController.text)){
      EasyLoading.show();
      LoginEntity? loginEntity = await NFTService.login(HttpRunnerParams(data: {"phone":phoneController.text,"password":pswController.text}));
      EasyLoading.dismiss();
      Get.offAndToNamed(Routes.NAV);
    }else{
      EasyLoading.showToast('login.phone.correct'.tr);
    }
  }

  void pushToRegisterPage() {
    Get.toNamed(Routes.LOGIN + Routes.REGISTER);
  }

  void pushToForgetPswPage() {
    Get.toNamed(Routes.LOGIN + Routes.FORGETPSW);
  }

}