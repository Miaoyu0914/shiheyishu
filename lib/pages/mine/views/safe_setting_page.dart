import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/safe_setting_controller.dart';

class SafeSettingPage extends GetView<SafeSettingController> {
  const SafeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SafeSettingController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        appBar: NormalAppBar(
          title: 'safe.title'.tr,
        ).getAppBar(context),
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
                }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: AppColors.borderInsideColor,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
              inset: true),
        ]
      ),
      child: ListView.separated(itemBuilder: (context, index){
        return InkWell(
          onTap: () => controller.pushToSafeSettingPages(index),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  WrapperImage(
                    url: controller.menuImages[index],
                    width: 20,
                    height: 20,
                    imageType: ImageType.assets,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.menuTitles[index],
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
          ),
        );
      }, separatorBuilder: (context, index){
        return const Padding(
          padding: EdgeInsets.only(left: 40,top: 16,bottom: 16),
          child: Divider(
            height: 1,
            color: AppColors.mineCellLineColor,
          ),
        );
      }, itemCount: controller.menuTitles.length,shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),),
    );
  }
}