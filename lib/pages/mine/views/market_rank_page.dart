import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/market_rank_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/market_rank_controller.dart';

class MarketRankPage extends GetView<MarketRankController> {
  const MarketRankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketRankController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'market.rank.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        WrapperImage(
          url: 'market_rank.png',
          width: Get.width,
          height: 400,
          imageType: ImageType.assets,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 320),
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 49, right: 39),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'market.rank.name'.tr,
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      Text(
                        'market.rank.rank'.tr,
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(bottom: 15),
                  itemBuilder: (context, index) {
                    MarketRankEntity rank = controller.rankList![index];
                    return Container(
                      margin: const EdgeInsets.only(top: 15,left: 15,right: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: AppColors.main,
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
                          Row(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(19)),
                                      child: WrapperImage(
                                        url: rank.headImg,
                                        width: 38,
                                        height: 38,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      rank.nickname!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                              child: index < 3
                                  ? WrapperImage(
                                url: controller.topImage[index],
                                width: 36,
                                height: 36,
                                imageType: ImageType.assets,
                              )
                                  : Container(
                                width: 36,
                                height: 36,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColors.rankBackColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(18))),
                                child: Text(
                                  index.toString(),
                                  style: const TextStyle(
                                      color: AppColors
                                          .loginButtonTitleColor,
                                      fontSize: 13),
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                  itemCount: controller.rankList!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
