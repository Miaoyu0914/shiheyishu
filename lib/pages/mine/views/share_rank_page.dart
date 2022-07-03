import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/share_rank_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/share_rank_controller.dart';

class ShareRankPage extends GetView<ShareRankController> {
  const ShareRankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareRankController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'share.rank.title'.tr).getAppBar(context),
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
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75),
                child: WrapperImage(
                  url: 'share_rank.png',
                  width: Get.width - 40,
                  height: 200,
                  imageType: ImageType.assets,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(35)),
                      child: WrapperImage(
                        url: controller.rankList![2].headImg,
                        width: 70,
                        height: 70,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        child: WrapperImage(
                          url: controller.rankList![0].headImg,
                          width: 70,
                          height: 70,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        child: WrapperImage(
                          url: controller.rankList![2].headImg,
                          width: 70,
                          height: 70,
                        )),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 28),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'share.rank.rank'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'share.rank.name'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'share.rank.num'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    ShareRankEntity rank = controller.rankList![index + 3];
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${index + 3}',
                            style: const TextStyle(
                                color: AppColors.navSelectedTitleColor,
                                fontSize: 13),
                          ),
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
                          Text(
                            rank.directNum.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.rankList!.length - 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
