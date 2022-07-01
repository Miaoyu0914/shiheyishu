import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/account_privacy_controller.dart';

class AccountPrivacyPage extends GetView<AccountPrivacyController> {
  const AccountPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountPrivacyController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'privacy.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _body();
                default:
                  return Container();
              }
            }, childCount: 1))
          ],
        ),
      );
    });
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.borderInsideColor,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    inset: true),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'privacy.id'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                '${controller.userInfo!.id}',
                style: const TextStyle(
                    color: AppColors.nftUnselectColor, fontSize: 15),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.borderInsideColor,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    inset: true),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'privacy.phone'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                controller.userInfo!.phone!,
                style: const TextStyle(
                    color: AppColors.nftUnselectColor, fontSize: 15),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.borderInsideColor,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    inset: true),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'privacy.wallet.address'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    controller.userInfo!.ethAddress!,
                    maxLines: 1,
                    style: const TextStyle(
                        color: AppColors.nftUnselectColor,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.borderInsideColor,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    inset: true),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'privacy.register.time'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                controller.userInfo!.createTime!.split(' ').first,
                style: const TextStyle(
                    color: AppColors.nftUnselectColor, fontSize: 15),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => controller.pushToUserAgreementPage(),
          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.borderInsideColor,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 1,
                      inset: true),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'privacy.user.agreement'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                WrapperImage(
                  url: 'arrow.png',
                  width: 7,
                  height: 14,
                  imageType: ImageType.assets,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
