import 'dart:math';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_blind_box_detail_controller.dart';

class MineBlindBoxDetailPage extends StatefulWidget {
  const MineBlindBoxDetailPage({Key? key}) : super(key: key);

  @override
  State<MineBlindBoxDetailPage> createState() => _MineBlindBoxDetailPageState();
}

class _MineBlindBoxDetailPageState extends State<MineBlindBoxDetailPage>
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

  final controller = Get.find<MineBlindBoxDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineBlindBoxDetailController>(builder: (controller) {
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
                      return _allGoods();
                    case 5:
                      return _detailShow();
                    case 6:
                      return _blindBoxIntroduce();
                    case 7:
                      return _orderList();
                    case 8:
                      return _buyInfo();
                    case 9:
                      return _buyButton();
                    default:
                      return Container();
                  }
                }, childCount: 10))
          ],
        ),
      );
    });
  }

  Widget _buyButton() {
    if(controller.isOpen){
      return Container();
    }
    return InkWell(
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
        margin: const EdgeInsets.only(top: 15, bottom: 50, left: 210, right: 15),
        child: Text(
          'blind.box.detail.open'.tr,
          style: const TextStyle(
              height: 1, color: AppColors.loginButtonTitleColor, fontSize: 17),
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
                'blind.box.detail.must.know'.tr,
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
              '          ' + controller.blindBoxDetailEntity!.purchaseInfo!,
              style: const TextStyle(
                  color: AppColors.nftDetailInfoColor, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderList() {
    return Offstage(
      offstage: controller.blindBoxDetailEntity!.orderListArr!.isEmpty,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
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
                    'blind.box.detail.record'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                OrderListArr order = controller.blindBoxDetailEntity!.orderListArr![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(22)),
                            child: WrapperImage(url: order.img, width: 44, height: 44,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(order.name!, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                                ),
                                Text(order.time!, style: const TextStyle(color: Colors.white, fontSize: 10),),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(controller.blindBoxDetailEntity!.price!, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Text(order.goodDesc!, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 10),),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: controller.blindBoxDetailEntity!.orderListArr!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _blindBoxIntroduce() {
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
                    'blind.box.detail.introduce'.tr,
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
                  '          ' + controller.blindBoxDetailEntity!.info!,
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
                    'blind.box.detail.nft.introduce'.tr,
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
                  '          ' + controller.blindBoxDetailEntity!.info!,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _detailShow() {
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
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
                      'blind.box.detail.detail'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              HtmlWidget(controller.blindBoxDetailEntity!.content!,)
            ],
          ),
        ],
      ),
    );
  }

  Widget _allGoods() {
    return Offstage(
      offstage: controller.blindBoxDetailEntity!.goodsList!.isEmpty,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
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
                    'blind.box.detail.all'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                GoodsList good =
                controller.blindBoxDetailEntity!.goodsList![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              good.goodsName!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'blind.box.detail.pre'.tr,
                                style: const TextStyle(
                                    color: AppColors.nftUnselectColor,
                                    fontSize: 10),
                              ),
                              Text(
                                '￥${good.price}',
                                style: const TextStyle(
                                    color: AppColors.nftUnselectColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        'blind.box.detail.percent'.tr + '${good.probability}%',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor, fontSize: 12),
                      )
                    ],
                  ),
                );
              },
              itemCount: controller.blindBoxDetailEntity!.goodsList!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
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
                    'blind.box.detail.issuer.info'.tr,
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
                  '          ' + controller.blindBoxDetailEntity!.issuerInfo!,
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
                    'blind.box.detail.creator.info'.tr,
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
                  '          ' + controller.blindBoxDetailEntity!.authorInfo!,
                  style: const TextStyle(
                      color: AppColors.nftDetailInfoColor, fontSize: 13),
                ),
              )
            ],
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
                  url: controller.blindBoxDetailEntity!.authorImage,
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
                        'blind.box.detail.creator'.tr +
                            controller.blindBoxDetailEntity!.authorName!,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      'blind.box.detail.issuer'.tr +
                          controller.blindBoxDetailEntity!.issuer!,
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
                'blind.box.detail.money'.tr,
                style: const TextStyle(
                    color: AppColors.codeButtonTitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                controller.blindBoxDetailEntity!.price!,
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
            ' ' + controller.blindBoxDetailEntity!.name! + ' ',
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
                    url: controller.blindBoxDetailEntity!.image,
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
                    width: 18,
                    height: 18,
                    imageType: ImageType.assets,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                'blind.box.detail.title'.tr,
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
