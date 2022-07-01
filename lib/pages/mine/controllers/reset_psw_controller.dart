import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class ResetPswController extends ViewStateController {
  bool isLoginPsw = true;
  ResetPswController({required this.isLoginPsw});
  LoginEntity? userInfo;
  TextEditingController codeController = TextEditingController();
  TextEditingController newPSWController = TextEditingController();
  TextEditingController newPSWAgainController = TextEditingController();
  String codeButtonTitle = 'reset.psw.get.code'.tr;
  int countNumber = 60;
  bool canSend = true;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    userInfo = Constant.USERINFOVALUE;
  }

  Future<void> sendCode() async {
    if(canSend){
      if(CommonUtils.isPhoneNumber(userInfo!.phone!)){
        EasyLoading.show();
        bool? isSendSms = await NFTService.sendSMS(HttpRunnerParams(data: {"phone":userInfo!.phone,"scene":isLoginPsw ? "forget_password" : "blind_bank"}));
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

  Future<void> resetPsw() async {
    EasyLoading.show();
    bool? isSuccess;
    if(isLoginPsw){
      isSuccess = await NFTService.resetPSW(HttpRunnerParams(data: {
        'password': newPSWController.text,
        're_password': newPSWAgainController.text,
        'sms_code': codeController.text
      }));
    }else{
      isSuccess = await NFTService.resetSecondPSW(HttpRunnerParams(data: {
        'password': newPSWController.text,
        're_password': newPSWAgainController.text,
        'sms_code': codeController.text
      }));
    }
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showToast('login.psw.change.success'.tr);
      Get.back();
    }
  }

}