import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_address_controller.dart';

class MineAddressPage extends GetView<MineAddressController> {
  const MineAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineAddressController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'mine.address.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
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
          padding: const EdgeInsets.only(top: 60, bottom: 15),
          child: WrapperImage(
            url: 'address_top.png',
            width: 150,
            height: 150,
            imageType: ImageType.assets,
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
              Expanded(flex: 1,child: Text('mine.address.name'.tr, style: const TextStyle(color: Colors.white, fontSize: 15),)),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: controller.nameController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.address.name.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 12)),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
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
              Expanded(flex: 1,child: Text('mine.address.phone'.tr, style: const TextStyle(color: Colors.white, fontSize: 15),)),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: controller.phoneController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.address.phone.hint'.tr,
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
              Expanded(flex: 1,child: Text('mine.address.address'.tr, style: const TextStyle(color: Colors.white, fontSize: 15),)),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: controller.addressController,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.address.address.hint'.tr,
                      hintStyle: const TextStyle(
                          color: AppColors.nftUnselectColor, fontSize: 12)),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => controller.addAddress(),
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
            margin: const EdgeInsets.only(top: 100, bottom: 50,left: 50, right: 50),
            child: Text(
              'mine.address.up'.tr,
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