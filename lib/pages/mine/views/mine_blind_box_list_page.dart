import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_blind_box_list_controller.dart';

import '../../../entities/mine_blind_box_list_entity.dart';

class MineBlindBoxListPage extends GetView<MineBlindBoxListController> {
  const MineBlindBoxListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineBlindBoxListController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar:
            NormalAppBar(title: 'mine.blind.box.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Column(
      children: [
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => controller.tabClicked(0),
                child: Column(
                  children: [
                    Text(
                      'mine.blind.box.already.open'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 0
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor,
                          fontSize: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 45,
                      height: 2,
                      color: controller.tabIndex == 0
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.tabClicked(1),
                child: Column(
                  children: [
                    Text(
                      'mine.blind.box.future.open'.tr,
                      style: TextStyle(
                          color: controller.tabIndex == 1
                              ? AppColors.codeButtonTitleColor
                              : AppColors.nftUnselectColor,
                          fontSize: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 45,
                      height: 2,
                      color: controller.tabIndex == 1
                          ? AppColors.codeButtonTitleColor
                          : Colors.transparent,
                    )
                  ],
                ),
              ),
            ],
          ),
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
            child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
//横轴元素个数
                    crossAxisCount: 2,
//纵轴间距
                    mainAxisSpacing: 15.0,
//横轴间距
                    crossAxisSpacing: 10.0,
//子组件宽高长度比例
                    childAspectRatio: 0.62),
                itemBuilder: (context, index) {
                  Data blindBox = controller.tabIndex == 0
                      ? controller.alreadyBlindBoxes[index]
                      : controller.futureBlindBoxes[index];
                  return InkWell(
                    onTap: () => controller.pushToBlindBoxDetail(index),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color:
                              AppColors.mineBlindBoxOffsetColor,
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15),
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: WrapperImage(
                                      url: controller.tabIndex == 0
                                          ? blindBox.good!.goodsImage
                                          : blindBox.box!.image,
                                      width: 146,
                                      height: 162,
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        alignment: Alignment.center,
                                        padding:
                                        const EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            right: 20,
                                            left: 20),
                                        decoration: BoxDecoration(
                                            color: AppColors
                                                .blindBoxTitleBackColor,
                                            border: Border.all(
                                                color: AppColors
                                                    .blindBoxTitleBorderColor,
                                                width: 1),
                                            borderRadius:
                                            const BorderRadius
                                                .all(
                                                Radius.circular(
                                                    15))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: Text(
                                        controller.tabIndex == 0
                                            ? blindBox
                                            .good!.goodsName!
                                            : blindBox.box!.name!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            height: 1,
                                            overflow: TextOverflow
                                                .ellipsis),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'mine.blind.box.order'.tr,
                                      style: const TextStyle(
                                          color: AppColors
                                              .nftUnselectColor,
                                          fontSize: 10),
                                    ),
                                    Expanded(
                                      child: Text(
                                        blindBox.orderSn!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            color: Colors.white,
                                            fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'blind.box.money'.tr,
                                        style: const TextStyle(
                                            color: AppColors
                                                .codeButtonTitleColor,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        controller.tabIndex == 0
                                            ? blindBox.good!.price!
                                            : blindBox.box!.price!,
                                        style: const TextStyle(
                                            color: AppColors
                                                .codeButtonTitleColor,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.tabIndex == 0
                    ? controller.alreadyBlindBoxes.length
                    : controller.futureBlindBoxes.length,
                padding: const EdgeInsets.all(15)),
          ),
        )
      ],
    );
  }
}
