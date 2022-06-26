import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/market_nft_list_entity.dart';
import 'package:shiheyishu/pages/market/controllers/market_controller.dart';

class MarketPage extends GetView<MarketController> {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
          backgroundColor: AppColors.main,
          appBar: AppBar(
            title: Center(
                child: Text(
              'market.title'.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            leadingWidth: 0,
            leading: Container(),
            backgroundColor: AppColors.main,
            elevation: 0,
          ),
          body: Column(
            children: [_searchBar(context), _screenBar(), _marketNFTList()],
          ));
    });
  }

  Widget _marketNFTList() {
    if(controller.marketNFTs.isEmpty){
      return Container();
    }
    return Expanded(
      child: SmartRefresher(
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
                    Data nft =  controller.marketNFTs[index];
                    return Container(
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
                                      url: nft.img,
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
                                        nft.goodName!,
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
                                      '${nft.good!.limitNum}/${nft.good!.totalNum}',
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
                                        nft.price!,
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
                    );
                  },
                  itemCount: controller.marketNFTs.length,
                  padding: const EdgeInsets.only(bottom: 126,left: 15,right: 15)),
            ),
    );
  }

  Widget _screenBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15,top: 11, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => controller.priceScreenClicked(),
            child: Row(
              children: [
                Text('market.price'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
                WrapperImage(url: controller.priceValue == 0 ? 'un_screen.png' : controller.priceValue == 1 ? 'top.png':'bottom.png', imageType: ImageType.assets, width: 6, height: 12,)
              ],
            ),
          ),
          InkWell(
            onTap: () => controller.newScreenClicked(),
            child: Row(
              children: [
                Text('market.new'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
                WrapperImage(url: controller.newValue == 0 ? 'un_screen.png' : controller.newValue == 1 ? 'top.png':'bottom.png', imageType: ImageType.assets, width: 6, height: 12,)
              ],
            ),
          ),
          Row(
            children: [
              Text('market.screen'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
              WrapperImage(url: 'screen.png', imageType: ImageType.assets, width: 6, height: 12,)
            ],
          )
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: AppColors.borderInsideColor,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
              inset: true),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: WrapperImage(
              url: 'search.png',
              width: 17,
              height: 17,
              imageType: ImageType.assets,
            ),
          ),
          Expanded(
            child: TextField(
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.search();
              },
              controller: controller.searchController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration.collapsed(
                  hintText: 'market.search.hint'.tr,
                  hintStyle: const TextStyle(
                      color: AppColors.nftUnselectColor, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
