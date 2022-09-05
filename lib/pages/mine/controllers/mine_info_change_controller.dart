import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_controller.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineInfoChangeController extends ViewStateController {
  UserInfoEntity? userInfoEntity;
  TextEditingController nameController = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  final mineController = Get.find<MineController>();
  bool isChangeImage = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getUserInfo();
  }

  Future<void> getUserInfo() async {
    userInfoEntity = await NFTService.getUserInfo(HttpRunnerParams());
    setIdle();
  }

  Future<void> pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if(image!.path != ''){
      isChangeImage = true;
      update();
    }
  }

  Future<void> saveUserInfo() async {
    if(nameController.text != ''){
      bool? isNickSuccess = await NFTService.changeNickName(HttpRunnerParams(
        data: {
          'nick': nameController.text
        }
      ));
      if(isNickSuccess! && isChangeImage){
        bool? isImageSuccess = await NFTService.changeHeadImage(HttpRunnerParams(
          data: {
            'image': File(image!.path)
          },
        ));
        if(isImageSuccess!){
          success();
        }
      }else{
        success();
      }
    }else{
      EasyLoading.showToast('mine.info.nick.name.hint'.tr);
    }
  }

  void success() {
    EasyLoading.showSuccess('mine.info.save.success'.tr);
    mineController.getUserInfo();
    Get.back();
  }

}