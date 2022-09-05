import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_platform_order_detail_controller.dart';

class MinePlatformOrderDetailPage extends GetView<MinePlatformOrderDetailController> {
  const MinePlatformOrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinePlatformOrderDetailController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: controller.getOrderTitleString()).getAppBar(context),
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
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.getOrderStatusString(), style: const TextStyle(color: Colors.grey, fontSize: 15),),
              WrapperImage(
                url: controller.getOrderStatusImg(),
                width: 108,
                height: 108,
                imageType: ImageType.assets,
              )
            ],
          ),
        ),
        Container(
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
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.payAllKindBackColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          child: WrapperImage(
                            url: controller.data.good!.goodsImage,
                            width: 108,
                            height: 108,
                          )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              controller.data.good!.goodsName!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '￥ '+controller.data.good!.price!,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: AppColors.codeButtonTitleColor,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'x1'.toString(),
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'order.detail.price'.trParams({
                    'price': controller.data.price!
                  }),
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.codeButtonTitleColor,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  WrapperImage(url: 'diamonds.png', width: 20, height: 20, imageType: ImageType.assets,),
                  Text('order.detail.info'.tr, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    Text('order.detail.num'.trParams({
                      'order': controller.data.orderSn!
                    })+'  ', style: const TextStyle(color: Colors.white, fontSize: 14),),
                    InkWell(
                        onTap: () {
                          EasyLoading.showSuccess(
                              'order.detail.num.copy.hint'.tr);
                          Clipboard.setData(ClipboardData(
                              text:
                              controller.data.orderSn!));
                        },
                        child: WrapperImage(
                          url: 'copy.png',
                          width: 13,
                          height: 13,
                          imageType: ImageType.assets,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('order.detail.create.time'.trParams({'time': controller.data.createTime!}), style: const TextStyle(color: Colors.white, fontSize: 14),),
              ),
              Offstage(offstage: controller.data.status != 1, child: Text('order.detail.pay.time'.trParams({'time': controller.data.payTime!}), style: const TextStyle(color: Colors.white, fontSize: 14),)),
              Offstage(offstage: controller.data.status != -1, child: Text('order.detail.cancel.time'.trParams({'time': controller.data.cancelTime!}), style: const TextStyle(color: Colors.white, fontSize: 14),)),
            ],
          ),
        ),
        Offstage(
          offstage: controller.data.status != 0,
          child: InkWell(
            onTap: () => controller.gotoPay(),
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
                'order.detail.pay'.tr,
                style: const TextStyle(
                    height: 1,
                    color: AppColors.loginButtonTitleColor,
                    fontSize: 17),
              ),
            ),
          ),
        )
      ],
    );
  }
}