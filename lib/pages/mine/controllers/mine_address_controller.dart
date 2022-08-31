import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineAddressController extends ViewStateController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> addAddress() async {
    if(!CommonUtils.strIsEmpty(nameController.text) && !CommonUtils.strIsEmpty(phoneController.text) && !CommonUtils.strIsEmpty(addressController.text)){
      EasyLoading.show();
      bool? isSuccess = await NFTService.addAddress(HttpRunnerParams(
          data: {
            'name': nameController.text,
            'mobile': phoneController.text,
            'detail': addressController.text
          }
      ));
      EasyLoading.dismiss();
      if(isSuccess!){
        EasyLoading.showSuccess('mine.address.add.success'.tr);
        Get.back();
      }
    }else{
      EasyLoading.showError('edit.empty.error'.tr);
    }
  }

}