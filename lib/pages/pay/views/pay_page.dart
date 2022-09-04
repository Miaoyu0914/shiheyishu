import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/pay/controllers/pay_controller.dart';

class PayPage extends GetView<PayController> {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'pay.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _body(context);
                default:
                  return Container();
              }
            }, childCount: 1))
          ],
        ),
      );
    });
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            WrapperImage(
              url: 'pay_back.png',
              width: Get.width,
              height: 300,
              imageType: ImageType.assets,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 70),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'pay.count.down'.tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 45),
                        child: Row(
                          children: [
                            Text(
                              'pay.money'.tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.payType == 0
                                  ? controller.nftDetailEntity!.price!
                                  : controller.payType == 1
                                      ? controller.blindBoxDetailEntity!.price!
                                      : controller.payType == 2
                                          ? controller
                                              .marketDetailEntity!.price!
                                          : controller.mpoData!.price!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      WrapperImage(
                        url: 'star.png',
                        width: 20,
                        height: 20,
                        imageType: ImageType.assets,
                      ),
                      Text(
                        controller.payType == 0
                            ? controller.nftDetailEntity!.goodsName!
                            : controller.payType == 1
                                ? controller.blindBoxDetailEntity!.name!
                                : controller.payType == 2
                                    ? controller.marketDetailEntity!.goodsName!
                                    : controller.mpoData!.good!.goodsName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: AppColors.payAllKindBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              InkWell(
                onTap: () => controller.changePayKind(0),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: AppColors.payKindBackColor,
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
                      Row(
                        children: [
                          WrapperImage(
                            url: 'balance.png',
                            width: 17,
                            height: 17,
                            imageType: ImageType.assets,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'pay.balance'.tr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      WrapperImage(
                        url: controller.payKind == 0
                            ? 'selected.png'
                            : 'unselected.png',
                        width: 14,
                        height: 14,
                        imageType: ImageType.assets,
                      ),
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () => controller.changePayKind(1),
              //   child: Container(
              //     margin:
              //         const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              //     padding: const EdgeInsets.all(15),
              //     decoration: const BoxDecoration(
              //         color: AppColors.payKindBackColor,
              //         borderRadius: BorderRadius.all(Radius.circular(15)),
              //         boxShadow: [
              //           BoxShadow(
              //               color: AppColors.borderInsideColor,
              //               offset: Offset(0, 3),
              //               blurRadius: 6,
              //               spreadRadius: 1,
              //               inset: true),
              //         ]),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             WrapperImage(
              //               url: 'zhifubao.png',
              //               width: 17,
              //               height: 17,
              //               imageType: ImageType.assets,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 15),
              //               child: Text(
              //                 'pay.zhifubao'.tr,
              //                 style: const TextStyle(
              //                     color: Colors.white, fontSize: 15),
              //               ),
              //             )
              //           ],
              //         ),
              //         WrapperImage(
              //           url: controller.payKind == 1
              //               ? 'selected.png'
              //               : 'unselected.png',
              //           width: 14,
              //           height: 14,
              //           imageType: ImageType.assets,
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        Column(
          children: [
            InkWell(
              onTap: () => controller.pay(context),
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
                  'pay.pay'.tr,
                  style: const TextStyle(
                      height: 1,
                      color: AppColors.loginButtonTitleColor,
                      fontSize: 17),
                ),
              ),
            ),
            Container(
              color: AppColors.main,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 16.5, bottom: 16.5),
              margin: const EdgeInsets.only(top: 15, bottom: 42),
              child: Text(
                'pay.cancel'.tr,
                style:
                    const TextStyle(height: 1, color: Colors.red, fontSize: 17),
              ),
            )
          ],
        )
      ],
    );
  }
}
