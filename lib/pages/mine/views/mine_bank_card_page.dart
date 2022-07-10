import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_bank_card_controller.dart';

class MineBankCardPage extends GetView<MineBankCardController> {
  const MineBankCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineBankCardController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar:
            NormalAppBar(title: 'mine.bank.card.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
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
      onTap: () => controller.resetPsw(),
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
          'mine.bank.card.sure'.tr,
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
              Text(
                'mine.bank.card.name'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: controller.nameController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.bank.card.name.hint'.tr,
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
              Text(
                'mine.bank.card.card'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: controller.cardController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.bank.card.card.hint'.tr,
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
              Text(
                'mine.bank.card.bank'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: controller.bankController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'mine.bank.card.bank'.tr,
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
                child: Row(
                  children: [
                    Text(
                      'mine.bank.card.code'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.codeController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                            hintText: 'mine.bank.card.code.hint'.tr,
                            hintStyle: const TextStyle(
                                color: AppColors.nftUnselectColor,
                                fontSize: 15)),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                  onTap: () => controller.sendCode(),
                  child: Text(
                    controller.codeButtonTitle,
                    style: const TextStyle(
                        color: AppColors.navSelectedTitleColor, fontSize: 15),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
