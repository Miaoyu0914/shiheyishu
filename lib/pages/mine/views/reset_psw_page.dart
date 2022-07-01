import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/reset_psw_controller.dart';

class ResetPswPage extends GetView<ResetPswController> {
  const ResetPswPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPswController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(
                title: controller.isLoginPsw
                    ? 'reset.psw.title'.tr
                    : 'reset.psw.second.title'.tr)
            .getAppBar(context),
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
          'reset.psw.sure'.tr,
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
                'reset.psw.phone'.tr,
                style: const TextStyle(
                    color: AppColors.nftUnselectColor, fontSize: 15),
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
                      'reset.psw.code'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller.codeController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
                'reset.psw.new'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: controller.newPSWController,
                  cursorColor: Colors.white,
                  obscureText: true,
                  keyboardType: controller.isLoginPsw ? TextInputType.text : TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'reset.psw.new.hint'.tr,
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
                'reset.psw.again'.tr,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: TextField(
                  controller: controller.newPSWAgainController,
                  cursorColor: Colors.white,
                  obscureText: true,
                  keyboardType: controller.isLoginPsw ? TextInputType.text : TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration.collapsed(
                      hintText: 'reset.psw.again.hint'.tr,
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
