import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class RealNameController extends ViewStateController {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

  }

  Future<void> realNameAuthentication() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.getRealName(HttpRunnerParams(
      data: {
        'real_name': nameController.text,
        'id_num': idController.text,
        'accountNo': cardController.text,
        'bankPreMobile': phoneController.text
      }
    ));
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showSuccess('real.name.success'.tr);
      Get.back();
    }
  }
}