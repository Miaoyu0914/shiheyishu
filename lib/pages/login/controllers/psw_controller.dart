import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class ForgetPswController extends ViewStateController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  TextEditingController pswAgainController = TextEditingController();
  String codeButtonTitle = 'login.code.get'.tr;
  int countNumber = 60;
  bool canSend = true;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendCode() async {
    if(canSend){
      if(CommonUtils.isPhoneNumber(phoneController.text)){
        EasyLoading.show();
        bool? isSendSms = await NFTService.sendSMS(HttpRunnerParams(data: {"phone":phoneController.text,"scene":"forget_password"}));
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

  Future<void> changePsw() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.changePSW(HttpRunnerParams(data: {
      'phone': phoneController.text,
      'password': pswController.text,
      're_password': pswAgainController.text,
      'sms_code': codeController.text
    }));
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showToast('login.psw.change.success'.tr);
      Get.back();
    }
  }
}