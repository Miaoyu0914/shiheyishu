import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineBankCardController extends ViewStateController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  String codeButtonTitle = 'mine.bank.card.code.get'.tr;
  int countNumber = 60;
  bool canSend = true;
  Timer? _timer;
  LoginEntity? userInfo;

  @override
  void onInit() {
    super.onInit();
    userInfo = Constant.USERINFOVALUE;
  }

  Future<void> sendCode() async {
    if (canSend) {
      if (CommonUtils.isPhoneNumber(userInfo!.phone!)) {
        EasyLoading.show();
        bool? isSendSms = await NFTService.sendSMS(HttpRunnerParams(
            data: {"phone": userInfo!.phone, "scene": "blind_bank"}));
        EasyLoading.dismiss();
        if (isSendSms!) {
          canSend = false;
          startCodeTimer();
        }
      } else {
        EasyLoading.showToast('login.phone.correct'.tr);
      }
    }
  }

  void startCodeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countNumber <= 0) {
        canSend = true;
        codeButtonTitle = 'mine.bank.card.code.get'.tr;
        _timer?.cancel();
        countNumber = 60;
        update();
      } else {
        countNumber -= 1;
        codeButtonTitle = '$countNumber S';
        update();
      }
    });
  }

  Future<void> resetPsw() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.addBankCard(HttpRunnerParams(data: {
      'bank_name': nameController.text,
      'bank_account': cardController.text,
      'bank': bankController.text,
      'sms_code': codeController.text
    }));
    EasyLoading.dismiss();
    if (isSuccess!) {
      EasyLoading.showToast('mine.bank.card.success'.tr);
      Get.back();
    }
  }
}
