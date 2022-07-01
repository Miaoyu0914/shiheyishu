import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/storage_manager.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class MineController extends ViewStateController {
  LoginEntity? userInfo;
  List<String> menuTitleList = [
    'mine.3d.room'.tr,
    'mine.market.order'.tr,
    'mine.platform.order'.tr,
    'mine.donation'.tr,
    'mine.compose'.tr
  ];
  List<String> menuImageList = [
    'mine_3d_room.png',
    'mine_3d_room.png',
    'mine_3d_room.png',
    'mine_donation.png',
    'mine_compose.png'
  ];
  List<String> settingTitleList = [
    'mine.safe.setting'.tr,
    'mine.certification'.tr,
    'mine.logout'.tr
  ];
  List<String> settingImageList = [
    'mine_safe_setting.png',
    'mine_safe_setting.png',
    'mine_logout.png'
  ];

  @override
  void onInit() {
    super.onInit();
    userInfo = Constant.USERINFOVALUE;
  }

  void pushToWalletPage() {
    Get.toNamed(Routes.NAV + Routes.WALLET);
  }

  void pushToSettingPages(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.NAV + Routes.SAFE);
        break;
      case 2:
        logout();
        break;
      default:
        break;
    }
  }

  void logout() {
    Get.bottomSheet(
        Container(
          margin: const EdgeInsets.all(20),
          height: 100,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  StorageManager.clearAll();
                  Get.back();
                  Get.offAndToNamed(Routes.LOGIN);
                },
                child: SizedBox(
                  width: Get.width,
                  child: Center(
                    child: Text(
                      'mine.logout.sure'.tr,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Divider(height: 1, color: AppColors.mineCellLineColor,),
              ),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: SizedBox(
                  width: Get.width,
                  child: Center(
                    child: Text(
                      'mine.logout.cancel'.tr,
                      style: const TextStyle(
                          color: AppColors.codeButtonTitleColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.main,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
    );
  }
}
