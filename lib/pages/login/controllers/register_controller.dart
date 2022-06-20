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
  int countNumber = 10;
  Timer? _timer;
  bool isAgree = true;

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> sendCode() async {
    await startCodeTimer();
  }

  Future<void> startCodeTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if(countNumber <= 0){
        _timer?.cancel();
        _timer = null;
        countNumber = 10;
        codeButtonTitle = 'login.code.get'.tr;
        update();
      }else{
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