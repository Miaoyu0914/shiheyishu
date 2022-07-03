import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/real_name_controller.dart';

class RealNamePage extends GetView<RealNameController> {
  const RealNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealNameController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'real.name.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _body();
                case 1:
                  return _button();
                default:
                  return Container();
              }
            }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _button() {
    return InkWell(
      onTap: () => controller.realNameAuthentication(),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.loginButtonLeftColor,
                  AppColors.loginButtonRightColor
                ])),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 16.5, bottom: 16.5),
        margin: const EdgeInsets.only(top: 100, left: 54, right: 54),
        child: Text(
          'real.name.sure'.tr,
          style: const TextStyle(
              height: 1, color: AppColors.loginButtonTitleColor, fontSize: 17),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'real.name.name'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: controller.nameController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'real.name.name.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 15)),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'real.name.id'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: controller.idController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'real.name.id.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 15)),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'real.name.card'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: controller.cardController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'real.name.card.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 15)),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'real.name.phone'.tr,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextField(
                  controller: controller.phoneController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'real.name.phone.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}