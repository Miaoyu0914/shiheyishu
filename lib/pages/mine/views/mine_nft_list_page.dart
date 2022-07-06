import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_nft_list_controller.dart';
import 'package:shiheyishu/entities/mine_goods_list_entity.dart';

class MineNFTListPage extends GetView<MineNFTListController> {
  const MineNFTListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineNFTListController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'mine.album.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context,LoadStatus? mode){
                return CommonUtils.refreshFooter(mode);
              },
            ),
            controller: controller.refreshController,
            onRefresh: controller.refreshList,
            onLoading: controller.loadMoreList,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 15.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 0.67),
                itemBuilder: (context, index) {
                  Data good =  controller.goods[index];
                  return InkWell(
                    onTap: () => controller.pushToGoodDetailPage(index),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    child: WrapperImage(
                                      url: good.good!.goodsImage,
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.3,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10,right: 10),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, right: 20, left: 20),
                                        decoration: BoxDecoration(
                                            color: AppColors.blindBoxTitleBackColor,
                                            border: Border.all(
                                                color: AppColors.blindBoxTitleBorderColor,
                                                width: 1),
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(15))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,right: 20),
                                      child: Text(
                                        good.good!.goodsName!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            height: 1,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'market.number'.tr,
                                      style: const TextStyle(
                                          color: AppColors.nftUnselectColor, fontSize: 10),
                                    ),
                                    Text(
                                      '${good.good!.limitNum}/${good.good!.totalNum}',
                                      style: const TextStyle(color: Colors.white, fontSize: 10),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'market.money'.tr,
                                        style: const TextStyle(
                                            color: AppColors.codeButtonTitleColor, fontSize: 16),
                                      ),
                                      Text(
                                        good.good!.price!,
                                        style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 16),
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
                itemCount: controller.goods.length,
                padding: const EdgeInsets.all(15)),
          );
  }
}