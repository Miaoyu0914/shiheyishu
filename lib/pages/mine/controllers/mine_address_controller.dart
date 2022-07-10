import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
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
    EasyLoading.show();
    bool? isSuccess = await NFTService.addAddress(HttpRunnerParams());
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showSuccess('mine.address.add.success'.tr);
      Get.back();
    }
  }

}