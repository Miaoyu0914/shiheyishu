import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/home/controllers/nft_detail_controller.dart';

class NFTDetailPage extends StatefulWidget {
  const NFTDetailPage({Key? key}) : super(key: key);

  @override
  _NFTDetailPageState createState() => _NFTDetailPageState();
}

class _NFTDetailPageState extends State<NFTDetailPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _repeatController;

  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repeatController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 360.0).animate(_repeatController);
  }

  final controller = Get.find<NFTDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NFTDetailController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _nftShow();
                case 1:
                  return _nftTitle();
                case 2:
                  return _nftAuthor();
                case 3:
                  return _nftInfo();
                case 4:
                  return _buyInfo();
                case 5:
                  return _buyButton();
                default:
                  return Container();
              }
            }, childCount: 6))
          ],
        ),
      );
    });
  }

  Widget _buyButton() {
    return Offstage(
      offstage: controller.nftDetailEntity!.status == 3,
      child: InkWell(
        onTap: () => controller.pushToPayPage(),
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
          margin: const EdgeInsets.only(top: 15, bottom: 50, left: 50, right: 50),
          child: Text(
            controller.nftDetailEntity!.status == 1 ? 'home.nft.future.tag'.tr : 'nft.detail.buy'.tr,
            style: const TextStyle(
                height: 1, color: AppColors.loginButtonTitleColor, fontSize: 17),
          ),
        ),
      ),
    );
  }

  Widget _buyInfo() {
    return Container(
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: WrapperImage(
                  url: 'diamonds.png',
                  width: 20,
                  height: 20,
                  imageType: ImageType.assets,
                ),
              ),
              Text(
                'nft.detail.must.know'.tr,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Text(
              '          ' + controller.nftDetailEntity!.purchaseInfo!,
              style: const TextStyle(
                  color: AppColors.nftDetailInfoColor, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  Widget _nftInfo() {
    return Container(
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: WrapperImage(
                      url: 'diamonds.png',
                      width: 20,
                      height: 20,
                      imageType: ImageType.assets,
                    ),
                  ),
                  Text(
                    'nft.detail.nft.info'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '          ' + controller.nftDetailEntity!.info!,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: WrapperImage(
                      url: 'diamonds.png',
                      width: 20,
                      height: 20,
                      imageType: ImageType.assets,
                    ),
                  ),
                  Text(
                    'nft.detail.issuer.info'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  '          ' + controller.nftDetailEntity!.issuerInfo!,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: WrapperImage(
                      url: 'diamonds.png',
                      width: 20,
                      height: 20,
                      imageType: ImageType.assets,
                    ),
                  ),
                  Text(
                    'nft.detail.creator.info'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '          ' + controller.nftDetailEntity!.authorInfo!,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
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
                Text(
                  'nft.detail.identity.info'.tr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'nft.detail.album'.tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      InkWell(
                        onTap: () => controller.pushToSeriesPage(),
                        child: Row(
                          children: [
                            Text(
                              controller.nftDetailEntity!.seriesName! + '  ',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                            WrapperImage(
                              url: 'arrow.png',
                              width: 5,
                              height: 5,
                              imageType: ImageType.assets,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'nft.detail.number'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      '#${controller.nftDetailEntity!.advanceGoodsId!}/${controller.nftDetailEntity!.advanceNum!}',
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'nft.detail.type'.tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        controller.nftDetailEntity!.equityTypeDesc!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'nft.detail.standard'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    Text(
                      controller.nftDetailEntity!.standard!,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'nft.detail.flag'.tr,
                //         style:
                //             const TextStyle(color: Colors.white, fontSize: 13),
                //       ),
                //       Text(
                //         'H7SFG7SGFSF****H8FH8H',
                //         style:
                //             const TextStyle(color: Colors.white, fontSize: 13),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _nftAuthor() {
    return Container(
      padding: const EdgeInsets.all(15),
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
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: WrapperImage(
                  url: controller.nftDetailEntity!.authorImage,
                  width: 54,
                  height: 54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'nft.detail.creator'.tr +
                            controller.nftDetailEntity!.authorName!,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      'nft.detail.issuer'.tr +
                          controller.nftDetailEntity!.issuer!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'nft.detail.money'.tr,
                style: const TextStyle(
                    color: AppColors.codeButtonTitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                controller.nftDetailEntity!.price!,
                style: const TextStyle(
                    color: AppColors.codeButtonTitleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _nftTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WrapperImage(
            url: 'star.png',
            width: 18,
            height: 18,
            imageType: ImageType.assets,
          ),
          Text(
            ' ' + controller.nftDetailEntity!.goodsName! + ' ',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          WrapperImage(
            url: 'star.png',
            width: 18,
            height: 18,
            imageType: ImageType.assets,
          ),
        ],
      ),
    );
  }

  Widget _nftShow() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Column(
          children: [
            WrapperImage(
              url: 'nft_back_top.png',
              width: Get.width,
              height: 200,
              imageType: ImageType.assets,
            ),
            WrapperImage(
              url: 'nft_back_bottom.png',
              width: Get.width,
              height: 230,
              imageType: ImageType.assets,
            )
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 70),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0001) // 第三参数定义视图距离，值越小物体就离你越远，看着就有立体感
                    // 旋转Y轴角度，pi为圆半径，animation.value为动态获取的动画值
                    ..rotateY(pi * _animation.value / 180),
                  alignment: FractionalOffset.center, // 以轴中心开始动画
                  child: WrapperImage(
                    url: controller.nftDetailEntity!.goodsImage,
                    width: 180,
                    height: 180,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: CommonUtils.getAppBarHeight()),
          child: Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 40, top: 3),
                  child: WrapperImage(
                    url: 'nav_back.png',
                    width: 8,
                    height: 12,
                    imageType: ImageType.assets,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                'nft.detail.title'.tr,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _repeatController.dispose();
    super.dispose();
  }
}
