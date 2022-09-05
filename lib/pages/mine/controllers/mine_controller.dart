import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/storage_manager.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineController extends ViewStateController {
  UserInfoEntity? userInfoEntity;
  List<String> menuTitleList = [
    'mine.3d.room'.tr,
    'mine.market.order'.tr,
    'mine.platform.order'.tr,
    'mine.donation'.tr,
    'mine.compose'.tr,
    'mine.share.rank'.tr,
    'mine.market.rank'.tr
  ];
  List<String> menuImageList = [
    'mine_3d_room.png',
    'market_order.png',
    'platform_order.png',
    'mine_donation.png',
    'mine_compose.png',
    's_rank.png',
    'm_rank.png'
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
  List<String> settingHasRealNameTitleList = [
    'mine.safe.setting'.tr,
    'mine.logout'.tr
  ];
  List<String> settingHasRealNameImageList = [
    'mine_safe_setting.png',
    'mine_logout.png'
  ];

  String? imagePath = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    await getMineImage();
    await getUserInfo();
  }

  Future<void> getUserInfo() async {
    userInfoEntity = await NFTService.getUserInfo(HttpRunnerParams());
    update();
  }

  Future<void> getMineImage() async {
    imagePath = await NFTService.getMineImage(HttpRunnerParams());
  }

  void pushToWalletPage() {
    Get.toNamed(Routes.NAV + Routes.WALLET);
  }

  void pushToMineBlindBoxPage() {
    Get.toNamed(Routes.NAV + Routes.MINEBLINDBOXLIST);
  }

  void pushToMineAlbumListPage() {
    Get.toNamed(Routes.NAV + Routes.MINEALBUMLIST);
  }

  void pushToMenuPages(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.NAV + Routes.THREE);
        break;
      case 1:
        Get.toNamed(Routes.NAV + Routes.MINEMARKETORDERLIST);
        break;
      case 2:
        Get.toNamed(Routes.NAV + Routes.MINEPLATFORMORDERLIST);
        break;
      case 3:
        Get.toNamed(Routes.NAV + Routes.MINEGIVELIST);
        break;
      case 4:
        Get.toNamed(Routes.NAV + Routes.SYNTHESISLIST);
        break;
      case 5:
        Get.toNamed(Routes.NAV + Routes.SHARERANK);
        break;
      case 6:
        Get.toNamed(Routes.NAV + Routes.MARKETRANK);
        break;
      default:
        break;
    }
  }

  void pushToSettingPages(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.NAV + Routes.SAFE);
        break;
      case 1:
        userInfoEntity!.isReal == 0
            ? Get.toNamed(Routes.NAV + Routes.REALNAME)
            : logout();
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
              onTap: () {
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
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Divider(
                height: 1,
                color: AppColors.mineCellLineColor,
              ),
            ),
            InkWell(
              onTap: () {
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
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    );
  }

  void changeUserInfo() {
    Get.toNamed(Routes.NAV + Routes.CHANGEUSERINFO);
  }
}
