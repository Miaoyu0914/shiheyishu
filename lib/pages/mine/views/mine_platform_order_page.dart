import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_platform_order_controller.dart';
import 'package:shiheyishu/entities/mine_platform_order_entity.dart';

class MinePlatformOrderPage extends GetView<MinePlatformOrderController> {
  const MinePlatformOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinePlatformOrderController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar:
            NormalAppBar(title: 'platform.order.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Container(
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
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => controller.tabClicked(0),
                child: Column(
                  children: [
                    Text(
                      'platform.order.all'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 0
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      color: controller.tabIndex == 0
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                      width: 16,
                      height: 3,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.tabClicked(1),
                child: Column(
                  children: [
                    Text(
                      'platform.order.future.pay'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 1
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      color: controller.tabIndex == 1
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                      width: 16,
                      height: 3,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.tabClicked(2),
                child: Column(
                  children: [
                    Text(
                      'platform.order.already'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 2
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      color: controller.tabIndex == 2
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                      width: 16,
                      height: 3,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.tabClicked(3),
                child: Column(
                  children: [
                    Text(
                      'platform.order.cancel'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 3
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      color: controller.tabIndex == 3
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                      width: 16,
                      height: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: const WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  return CommonUtils.refreshFooter(mode);
                },
              ),
              controller: controller.refreshController,
              onRefresh: controller.refreshList,
              onLoading: controller.loadMoreList,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Data platformOrder = controller.getPlatformOrderData(index);
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: WrapperImage(
                                  url: platformOrder.good!.goodsImage,
                                  width: 108,
                                  height: 108,
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  platformOrder.good!.goodsName!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'platform.order.money'.tr +
                                          platformOrder.price!,
                                      style: const TextStyle(
                                          color: AppColors.codeButtonTitleColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                AppColors.loginButtonLeftColor,
                                                AppColors.loginButtonRightColor
                                              ])),
                                      child: Text(
                                        'platform.order.go.pay'.tr,
                                        style: const TextStyle(
                                            color: AppColors.codeButtonTitleColor,
                                            fontSize: 14,
                                            height: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.mineCellLineColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          alignment: Alignment.center,
                          child: Text(
                            '待支付',
                            style: const TextStyle(
                                color: AppColors.codeButtonTitleColor,
                                fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: controller.getListCount(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
