import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/cash_out_controller.dart';

class CashOutPage extends GetView<CashOutController> {
  const CashOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashOutController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'cash.out.title'.tr).getAppBar(context),
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
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            WrapperImage(
              url: 'pay_back.png',
              width: Get.width,
              height: 300,
              imageType: ImageType.assets,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 110, left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('cash.out.price'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          cursorColor: Colors.white,
                          controller: controller.priceController,
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          onChanged: (value) => controller.onTextFieldChanged(value),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: InkWell(
                                onTap: () => controller.allOut(),
                                child: Text('cash.out.all'.tr, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 12),),
                              ),
                            ),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text('￥', style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                            focusedBorder: const UnderlineInputBorder( // 不是焦点的时候颜色
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder( // 不是焦点的时候颜色
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('cash.out.discount'.trParams({'fee': controller.cashOutInfoEntity!.fee!}), style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 12),),
                        )
                      ],
                    ),
                  ),
                  Text('cash.out.can.out'.tr + controller.cashOutInfoEntity!.balance!, style: const TextStyle(color: Colors.white, fontSize: 14),),
                ],
              ),
            )
          ],
        ),
        Container(
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
                  Text(
                    'cash.out.reality'.tr,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Text(controller.amount, style: const TextStyle(
                  color: Colors.white, fontSize: 15),),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: AppColors.payAllKindBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('cash.out.account.title'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
              InkWell(
                onTap: () => controller.changePayType(),
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
                          Text(
                            'pay.balance'.tr,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      Text('${controller.payType == 0 ? 'cash.out.card'.tr : 'cash.out.ali'.tr} >', style: const TextStyle(
                          color: Colors.white, fontSize: 15),),
                    ],
                  ),
                ),
              ),
              Container(
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
                        Text(
                          'cash.out.name'.tr,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15),
                        )
                      ],
                    ),
                    Text(controller.payType == 0 ? controller.userInfoEntity!.bankName ?? '' : controller.userInfoEntity!.aliName, style: const TextStyle(
                        color: Colors.white, fontSize: 15),),
                  ],
                ),
              ),
              Container(
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
                        Text(
                          'cash.out.account'.tr,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15),
                        )
                      ],
                    ),
                    Text(controller.payType == 0 ? controller.userInfoEntity!.bankAccount ?? '' : controller.userInfoEntity!.aliAccount, style: const TextStyle(
                        color: Colors.white, fontSize: 15),),
                  ],
                ),
              ),
              Offstage(
                offstage: controller.payType == 1,
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
                          Text(
                            'cash.out.bank'.tr,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      Text(controller.payType == 0 ? controller.userInfoEntity!.bank ?? '' : '', style: const TextStyle(
                          color: Colors.white, fontSize: 15),),
                    ],
                  ),
                ),
              )
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: WrapperImage(
                      url: 'diamonds.png',
                      width: 20,
                      height: 20,
                      imageType: ImageType.assets,
                    ),
                  ),
                  Text(
                    'cash.out.info.title'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'cash.out.info'.tr,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
          ),
        ),
        InkWell(
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
            margin: const EdgeInsets.only(top: 20, left: 54, right: 54, bottom: 50),
            child: Text(
              'cash.out.title'.tr,
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