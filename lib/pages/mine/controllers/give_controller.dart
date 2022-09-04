import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class GiveController extends ViewStateController {
  var id;
  GiveController({required this.id});
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> giveToAnother() async {
    if(CommonUtils.isPhoneNumber(phoneController.text)){
      EasyLoading.show();
      bool? isSuccess = await NFTService.giveToAnother(HttpRunnerParams(
          data: {
            'id': id,
            'phone': phoneController.text
          }
      ));
      EasyLoading.dismiss();
      if(isSuccess!){
        EasyLoading.showSuccess('mine.nft.detail.give.success'.tr);
        Get.back();
        Get.back();
      }
    }else{
      EasyLoading.showToast('login.phone.correct'.tr);
    }
  }

}