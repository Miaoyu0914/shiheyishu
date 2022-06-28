import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isBusy) {
      return ViewStateBusyWidget();
    }
    return GetBuilder<MineController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _top();
                case 1:
                  return _buttons();
                case 2:
                  return _menuList();
                case 3:
                  return _settingList();
                default:
                  return Container();
              }
            }, childCount: 4))
          ],
        ),
      );
    });
  }

  Widget _settingList() {
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,bottom: 126),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: AppColors.borderInsideColor,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 1,
                inset: true),
          ]),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  WrapperImage(
                    url: controller.settingImageList[index],
                    width: 20,
                    height: 20,
                    imageType: ImageType.assets,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.settingTitleList[index],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: WrapperImage(
                  url: 'arrow.png',
                  width: 7,
                  height: 14,
                  imageType: ImageType.assets,
                ),
              )
            ],
          );
        },
        itemCount: controller.settingTitleList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(left: 40,top: 16,bottom: 16),
            child: Divider(
              height: 1,
              color: AppColors.mineCellLineColor,
            ),
          );
        },
      ),
    );
  }

  Widget _menuList() {
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: AppColors.borderInsideColor,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 1,
                inset: true),
          ]),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  WrapperImage(
                    url: controller.menuImageList[index],
                    width: 20,
                    height: 20,
                    imageType: ImageType.assets,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.menuTitleList[index],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: WrapperImage(
                  url: 'arrow.png',
                  width: 7,
                  height: 14,
                  imageType: ImageType.assets,
                ),
              )
            ],
          );
        },
        itemCount: controller.menuTitleList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(left: 40,top: 16,bottom: 16),
            child: Divider(
              height: 1,
              color: AppColors.mineCellLineColor,
            ),
          );
        },
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => controller.pushToWalletPage(),
          child: Column(
            children: [
              WrapperImage(
                url: 'mine_wallet.png',
                width: 74,
                height: 74,
                imageType: ImageType.assets,
              ),
              Text(
                'mine.wallet'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
        InkWell(
          child: Column(
            children: [
              WrapperImage(
                url: 'mine_blind_box.png',
                width: 74,
                height: 74,
                imageType: ImageType.assets,
              ),
              Text(
                'mine.blind.box'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
        InkWell(
          child: Column(
            children: [
              WrapperImage(
                url: 'mine_collection.png',
                width: 74,
                height: 74,
                imageType: ImageType.assets,
              ),
              Text(
                'mine.collection'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _top() {
    return Stack(
      children: [
        WrapperImage(
          url: 'liuxing.png',
          width: Get.width,
          height: Get.height / 5,
          imageType: ImageType.assets,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: CommonUtils.getAppBarHeight() - 16, bottom: 15),
              child: Center(
                child: Text(
                  'mine.title'.tr,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: [
                  WrapperImage(
                    url: 'mine_back.png',
                    width: Get.width - 30,
                    height: 150,
                    imageType: ImageType.assets,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            child: WrapperImage(
                              url: controller.userInfo!.headImg,
                              width: 80,
                              height: 80,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userInfo!.nickname!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      controller.userInfo!.phone! + '  ',
                                      style: const TextStyle(
                                          color: AppColors.nftUnselectColor,
                                          fontSize: 12),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          EasyLoading.showSuccess(
                                              'mine.copy.hint'.tr);
                                          Clipboard.setData(ClipboardData(
                                              text:
                                                  controller.userInfo!.phone!));
                                        },
                                        child: WrapperImage(
                                          url: 'search.png',
                                          width: 13,
                                          height: 13,
                                          imageType: ImageType.assets,
                                        ))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'mine.wallet.address'.tr,
                                    style: const TextStyle(
                                      color: AppColors.nftUnselectColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                      width: Get.width / 4,
                                      child: Text(
                                        controller.userInfo!.ethAddress! + '  ',
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: AppColors.nftUnselectColor,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        EasyLoading.showSuccess(
                                            'mine.copy.hint'.tr);
                                        Clipboard.setData(ClipboardData(
                                            text: controller
                                                .userInfo!.ethAddress!));
                                      },
                                      child: WrapperImage(
                                        url: 'search.png',
                                        width: 13,
                                        height: 13,
                                        imageType: ImageType.assets,
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
