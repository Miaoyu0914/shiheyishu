import 'dart:io';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_info_change_controller.dart';

class MineInfoChangePage extends GetView<MineInfoChangeController> {
  const MineInfoChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineInfoChangeController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'mine.info.title'.tr).getAppBar(context),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: InkWell(
            onTap: () => controller.pickImage(),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: controller.isChangeImage
                    ? Image.file(
                        File(controller.image!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : WrapperImage(
                        url: controller.userInfoEntity!.headImg,
                        width: 100,
                        height: 100,
                      )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            'mine.info.head.image'.tr,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Container(
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
              ]),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'mine.info.nick.name'.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  )),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: controller.nameController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.info.nick.name.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 12)),
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => controller.saveUserInfo(),
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
            margin: const EdgeInsets.only(
                top: 100, bottom: 50, left: 50, right: 50),
            child: Text(
              'mine.info.save'.tr,
              style: const TextStyle(
                  height: 1,
                  color: AppColors.loginButtonTitleColor,
                  fontSize: 17),
            ),
          ),
        )
      ],
    );
  }
}
