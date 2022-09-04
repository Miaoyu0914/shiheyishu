import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/charge_controller.dart';

class ChargePage extends GetView<ChargeController> {
  const ChargePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChargeController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'charge.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
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
                    child: Text('charge.hint'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: controller.priceController,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      onTap: () => controller.changeIndex(0),
                      decoration: InputDecoration(
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
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
          decoration: const BoxDecoration(
              color: AppColors.payAllKindBackColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('charge.select'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => controller.changeIndex(1),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: controller.selectIndex == 1 ? AppColors.loginButtonRightColor : Colors.grey),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.borderInsideColor,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 1,
                                inset: true
                            )
                          ],
                        ),
                        child: Text('100', style: TextStyle(color: controller.selectIndex == 1 ? AppColors.loginButtonRightColor : Colors.white, fontSize: 16),),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.changeIndex(2),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: controller.selectIndex == 2 ? AppColors.loginButtonRightColor : Colors.grey),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.borderInsideColor,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 1,
                                inset: true
                            )
                          ],
                        ),
                        child: Text('500', style: TextStyle(color: controller.selectIndex == 2 ? AppColors.loginButtonRightColor : Colors.white, fontSize: 16),),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.changeIndex(3),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: controller.selectIndex == 3 ? AppColors.loginButtonRightColor : Colors.grey),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.borderInsideColor,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 1,
                                inset: true
                            )
                          ],
                        ),
                        child: Text('1000', style: TextStyle(color: controller.selectIndex == 3 ? AppColors.loginButtonRightColor : Colors.white, fontSize: 16),),
                      ),
                    ),
                  ],
                ),
              ),
              Text('charge.select.tag'.tr, style: const TextStyle(color: Colors.grey, fontSize: 14),),
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
                    'charge.info.title'.tr,
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
                  'charge.info'.tr,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => controller.charge(),
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
              'charge.title'.tr,
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