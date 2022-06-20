import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class LoginController extends ViewStateController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pswController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print('login');
  }

  void login() {

  }

  void pushToRegisterPage() {
    Get.toNamed(Routes.LOGIN + Routes.REGISTER);
  }

  void pushToForgetPswPage() {
    Get.toNamed(Routes.LOGIN + Routes.FORGETPSW);
  }

}