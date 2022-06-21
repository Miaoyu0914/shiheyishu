import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/services/http/http_error.dart';
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
    if(CommonUtils.isPhoneNumber(phoneController.text)){
      try {
        EasyLoading.show();
        bool? isSendSms = await NFTService.sendSms(HttpRunnerParams(data: {"phone":phoneController.text,"scene":"register"}));
        if(isSendSms!){
          EasyLoading.dismiss();
        }
      } on HttpError catch (error) {
        EasyLoading.dismiss();
      }
      canSend = false;
      startCodeTimer();
    }else{
      EasyLoading.showToast('login.phone.correct'.tr);
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

  void register() {
    if(isAgree){

    }else{
      EasyLoading.showToast('login.register.agree'.tr);
    }
  }

  void changeAgree() {
    isAgree = !isAgree;
    update();
  }

}