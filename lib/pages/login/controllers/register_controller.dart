import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class RegisterController extends ViewStateController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  TextEditingController pswAgainController = TextEditingController();
  TextEditingController secondPswController = TextEditingController();
  TextEditingController secondPswAgainController = TextEditingController();
  TextEditingController inviteController = TextEditingController();
  String codeButtonTitle = 'login.code.get'.tr;
  int countNumber = 60;
  bool canSend = true;
  Timer? _timer;
  bool isAgree = true;

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> sendCode() async {
    if(canSend){
      if(CommonUtils.isPhoneNumber(phoneController.text)){
        EasyLoading.show();
        bool? isSendSms = await NFTService.sendSMS(HttpRunnerParams(data: {"phone":phoneController.text,"scene":"register"}));
        EasyLoading.dismiss();
        if(isSendSms!){
          canSend = false;
          startCodeTimer();
        }
      }else{
        EasyLoading.showToast('login.phone.correct'.tr);
      }
    }
  }

  void startCodeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer){
      if(countNumber <= 0){
        canSend = true;
        codeButtonTitle = 'login.code.get.again'.tr;
        _timer?.cancel();
        countNumber = 60;
        update();
      }else {
        countNumber -= 1;
        codeButtonTitle = '$countNumber S';
        update();
      }
    });
  }

  Future<void> register() async {
    EasyLoading.show();
    if(isAgree){
      bool? isSuccess = await NFTService.register(HttpRunnerParams(data: {
        'phone': phoneController.text,
        'sms_code': codeController.text,
        'password': pswController.text,
        're_password': pswAgainController.text,
        'second_password': secondPswController.text,
        're_second_password': secondPswAgainController.text,
        'invite_code': inviteController.text
      }));
      EasyLoading.dismiss();
      if(isSuccess!){
        EasyLoading.showToast('login.register.success'.tr);
        Get.back();
      }
    }else{
      EasyLoading.showToast('login.register.agree'.tr);
    }
  }

  void changeAgree() {
    isAgree = !isAgree;
    update();
  }

  void pushToAgreementPage(bool isUserAgreement) {
    Get.toNamed(Routes.LOGIN+Routes.REGISTER+Routes.AGREEMENT, arguments: {'isUserAgreement': isUserAgreement});
  }
}