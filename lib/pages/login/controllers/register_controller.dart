import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';

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

  void sendCode() {
    canSend = false;
    startCodeTimer();
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

  }

  void changeAgree() {
    isAgree = !isAgree;
    update();
  }

}