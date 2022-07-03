import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/board_list_entity.dart' as bl;
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_list_entity.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
          backgroundColor: AppColors.main,
          appBar: AppBar(
            title: Center(
                child: Text(
              'home'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
            leadingWidth: 0,
            leading: Container(),
            backgroundColor: AppColors.main,
            elevation: 0,
          ),
          body: SmartRefresher(
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
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  switch (index) {
                    case 0:
                      return _banner();
                    case 1:
                      return _board();
                    case 2:
                      return _album();
                    case 3:
                      return _nftList();
                    default:
                      return Container();
                  }
                }, childCount: 4))
              ],
            ),
          ));
    });
  }

  Widget _nftList() {
    return SizedBox(
      height: controller.nftIndex == 0 ? (520 * controller.hotNFTList.length + 106) : (520 * controller.futureNFTList.length + 106),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 44),
                child: InkWell(
                  onTap: () => controller.tabClicked(0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Text(
                        'home.nft.hot'.tr,
                        style: TextStyle(
                            color: controller.nftIndex == 0
                                ? Colors.white
                                : AppColors.nftUnselectColor,
                            fontSize: controller.nftIndex == 0 ? 15 : 14),
                      ),
                      Offstage(
                          offstage: controller.nftIndex != 0,
                          child: WrapperImage(
                            url: 'tab_bottom.png',
                            width: 42,
                            height: 5,
                            imageType: ImageType.assets,
                          ))
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.tabClicked(1),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Text(
                      'home.nft.future'.tr,
                      style: TextStyle(
                          color: controller.nftIndex == 1
                              ? Colors.white
                              : AppColors.nftUnselectColor,
                          fontSize: controller.nftIndex == 0 ? 15 : 14),
                    ),
                    Offstage(
                        offstage: controller.nftIndex != 1,
                        child: WrapperImage(
                          url: 'tab_bottom.png',
                          width: 42,
                          height: 5,
                          imageType: ImageType.assets,
                        ))
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.nftController,
                itemCount: 2,
                itemBuilder: (context, pageIndex) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      Data nft = pageIndex == 0
                          ? controller.hotNFTList[index]
                          : controller.futureNFTList[index];
                      return InkWell(
                        onTap: () => controller.pushToNFTDetailPage(nft.id),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          margin: const EdgeInsets.all(15),
                          // padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  child: WrapperImage(
                                    url: nft.goodsImage,
                                    width: Get.width - 30,
                                    height: (Get.width - 70) * 1.05,
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Opacity(
                                    opacity: 0.1,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20)),
                                        child: WrapperImage(
                                          url: nft.authorImage,
                                          width: 145,
                                          height: 145,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  nft.goodsName!,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(6),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    6),
                                                            bottomRight: Radius
                                                                .circular(6)),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .navSelectedTitleColor,
                                                        width: 1)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                          color: AppColors
                                                              .navSelectedTitleColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5))),
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        'home.nft.limit'.tr,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .loginButtonTitleColor,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            6)),
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        ' ${nft.totalNum}' +
                                                            'home.nft.unit'.tr,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .navSelectedTitleColor,
                                                            fontSize: 14),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                'home.nft.already'.tr +
                                                    '${nft.sale}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: WrapperImage(
                                                    url: nft.issuerImage,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                ),
                                                Text(
                                                  ' ' + nft.issuer!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'home.nft.money'.tr +
                                                  '${nft.price}',
                                              style: const TextStyle(
                                                  color: AppColors
                                                      .navSelectedTitleColor,
                                                  fontSize: 20),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: pageIndex == 0 ? controller.hotNFTList.length : controller.futureNFTList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _album() {
    return Container(
      height: 36,
      margin: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          HomeAlbumEntity album = controller.albums![index];
          return InkWell(
            onTap: () => controller.pushToAlbumPage(album.id),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              padding:
                  const EdgeInsets.only(left: 3, right: 10, top: 3, bottom: 3),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.borderInsideColor,
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 1,
                        inset: true),
                  ]),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: WrapperImage(
                        url: album.icon,
                        width: 30,
                        height: 30,
                      )),
                  Text(
                    album.seriesName!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: controller.albums!.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }

  Widget _board() {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(15),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WrapperImage(
                url: 'board.png',
                imageType: ImageType.assets,
                width: 86,
                height: 35,
              ),
              SizedBox(
                width: 150,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    bl.Data board = controller.boardListEntity!.data![index];
                    return InkWell(
                      onTap: () => controller.pushToBoardDetailPage(index),
                      child: Row(
                        children: [
                          Text(
                            board.title!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                  controller: controller.boardController,
                  itemCount: controller.boardListEntity!.data!.length,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
          InkWell(
            onTap: () => controller.pushToBoardListPage(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.5)),
                  border: Border.all(
                      color: AppColors.navSelectedTitleColor, width: 1)),
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, left: 11, right: 11),
              margin: const EdgeInsets.only(right: 15),
              child: Text(
                'home.more'.tr,
                style: const TextStyle(
                    color: AppColors.navSelectedTitleColor,
                    fontSize: 13,
                    height: 1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _banner() {
    return Container(
        height: 130,
        margin: const EdgeInsets.all(15),
        child: PageView.builder(
          itemBuilder: (context, index) {
            HomeBannerEntity banner = controller.banners![index];
            return InkWell(
              child: WrapperImage(url: banner.imagePath),
            );
          },
          itemCount: controller.banners!.length,
          controller: controller.bannerController,
        ));
  }
}
