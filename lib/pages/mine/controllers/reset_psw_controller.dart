import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/login_entity.dart';

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

}