import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/album_detail_list_entity.dart';
import 'package:shiheyishu/pages/home/controllers/series_controller.dart';

class SeriesPage extends GetView<SeriesController> {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeriesController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'nft.series.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _topCard();
                case 1:
                  return _goodList();
                default:
                  return Container();
              }
            }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _goodList() {
    return SizedBox(
      height: controller.albumGoods![controller.seriesIndex]!.isEmpty ? 500 : (270 * ((controller.albumGoods![controller.seriesIndex]!.length + 1) ~/ 2) + 150),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => controller.tabClicked(0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Text(
                        'nft.series.going'.tr,
                        style: TextStyle(
                            color: controller.seriesIndex == 0
                                ? Colors.white
                                : AppColors.nftUnselectColor,
                            fontSize: controller.seriesIndex == 0 ? 15 : 14),
                      ),
                      Offstage(
                          offstage: controller.seriesIndex != 0,
                          child: WrapperImage(
                            url: 'tab_bottom.png',
                            width: 42,
                            height: 5,
                            imageType: ImageType.assets,
                          ))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => controller.tabClicked(1),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Text(
                        'nft.series.future'.tr,
                        style: TextStyle(
                            color: controller.seriesIndex == 1
                                ? Colors.white
                                : AppColors.nftUnselectColor,
                            fontSize: controller.seriesIndex == 0 ? 15 : 14),
                      ),
                      Offstage(
                          offstage: controller.seriesIndex != 1,
                          child: WrapperImage(
                            url: 'tab_bottom.png',
                            width: 42,
                            height: 5,
                            imageType: ImageType.assets,
                          ))
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => controller.tabClicked(2),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Text(
                        'nft.series.already'.tr,
                        style: TextStyle(
                            color: controller.seriesIndex == 2
                                ? Colors.white
                                : AppColors.nftUnselectColor,
                            fontSize: controller.seriesIndex == 0 ? 15 : 14),
                      ),
                      Offstage(
                          offstage: controller.seriesIndex != 2,
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
          ),
          Expanded(
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                itemCount: 3,
                itemBuilder: (context, pageIndex) {
                  List<AlbumDetailListEntity> albums = controller.albumGoods![controller.seriesIndex]!;
                  if(albums.isEmpty){
                    return ViewStateEmptyWidget('nft.series.empty'.tr);
                  }
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴元素个数
                          crossAxisCount: 2,
                          //纵轴间距
                          mainAxisSpacing: 15.0,
                          //横轴间距
                          crossAxisSpacing: 10.0,
                          //子组件宽高长度比例
                          childAspectRatio: 0.64),
                      itemBuilder: (context, index) {
                        AlbumDetailListEntity album = albums[index];
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
                                          url: album.goodsImage ?? '',
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
                                            album.goodsName ?? '',
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
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'nft.series.issuer'.tr,
                                          style: const TextStyle(
                                              color: AppColors.nftUnselectColor, fontSize: 10),
                                        ),
                                        Text(
                                          album.authorName ?? '',
                                          style: const TextStyle(color: Colors.white, fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'nft.series.number'.tr,
                                            style: const TextStyle(
                                                color: AppColors.nftUnselectColor, fontSize: 10),
                                          ),
                                          Text(
                                            '#${album.id}/${album.totalNum}',
                                            style: const TextStyle(color: Colors.white, fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'nft.series.money'.tr,
                                            style: const TextStyle(
                                                color: AppColors.codeButtonTitleColor, fontSize: 16),
                                          ),
                                          Text(
                                            album.price ?? '',
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
                      itemCount: controller.albumGoods?[controller.seriesIndex]!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 15,right: 15));
                }),
          )
        ],
      ),
    );
  }

  Widget _topCard() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: WrapperImage(
                  url: controller.albumDetailEntity!.cover,
                  width: Get.width - 30,
                  height: Get.width * 0.4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.width * 0.4 - 26,left: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(38)),
                        child: WrapperImage(
                          url: controller.albumDetailEntity!.icon,
                          width: 76,
                          height: 76,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.albumDetailEntity!.seriesName!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              controller.albumDetailEntity!.seriesName!,
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${controller.albumDetailEntity!.collNum}',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'nft.series.collection'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${controller.albumDetailEntity!.price}',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'nft.series.trade'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${controller.albumDetailEntity!.saleNum}',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'nft.series.owner'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${controller.albumDetailEntity!.min}',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'nft.series.low'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                              color: AppColors.borderInsideColor,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 1,
                              inset: true
                          ),
              ]
            ),
            child: Text(controller.albumDetailEntity!.content!, style: const TextStyle(color: Colors.white, fontSize: 12),),
          )
        ],
      ),
    );
  }
}
