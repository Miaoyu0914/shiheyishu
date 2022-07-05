import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/mine_give_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_give_controller.dart';

class MineGivePage extends GetView<MineGiveController> {
  const MineGivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineGiveController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'mine.give.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Column(
      children: [
        WrapperImage(
          url: 'give_top.png',
          width: 146,
          height: 146,
          imageType: ImageType.assets,
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
                Data give = controller.giveList[index];
                return Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.borderInsideColor,
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 1,
                            inset: true),
                      ]),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: WrapperImage(
                                  url: give.goodsImage ?? '',
                                  width: 54,
                                  height: 54,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    give.goodsName ?? '',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Text(
                                  'x' + give.num.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'mine.give.people'.tr,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                                Text(
                                  give.toPhone.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'mine.give.time'.tr,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              Text(
                                give.createTime.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: controller.giveList.length,
            ),
          ),
        )
      ],
    );
  }
}
