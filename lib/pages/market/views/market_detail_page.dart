import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart'hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/market_detail_entity.dart';
import 'package:shiheyishu/pages/market/controllers/market_detail_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MarketDetailPage extends StatefulWidget {
  const MarketDetailPage({Key? key}) : super(key: key);

  @override
  _MarketDetailPageState createState() => _MarketDetailPageState();
}

class _MarketDetailPageState extends State<MarketDetailPage>
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

  final controller = Get.find<MarketDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketDetailController>(builder: (controller) {
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
                  return _orderList();
                case 5:
                  return _buyInfo();
                case 6:
                  return _buyButton();
                default:
                  return Container();
              }
            }, childCount: 7))
          ],
        ),
      );
    });
  }

  Widget _buyButton() {
    return InkWell(
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
          'nft.detail.buy'.tr,
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
              '          ' + controller.marketDetailEntity!.good!.purchaseInfo!,
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
      offstage: controller.marketDetailEntity!.logs!.isEmpty,
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
                    'market.detail.record'.tr,
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
                Logs order = controller.marketDetailEntity!.logs![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(22)),
                            child: WrapperImage(url: order.headImg, width: 44, height: 44,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(order.nickname!, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                                ),
                                Text(order.createTime!, style: const TextStyle(color: Colors.white, fontSize: 10),),
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
                            child: Text('market.money'.tr+order.price!, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 13, fontWeight: FontWeight.bold),),
                          ),
                          Text(order.info!, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 10),),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: controller.marketDetailEntity!.logs!.length,
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
                  '          ' + controller.marketDetailEntity!.good!.goodsName!,
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
                  '          ' + controller.marketDetailEntity!.good!.issuerInfo!,
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
                  '          ' + controller.marketDetailEntity!.good!.authorInfo!,
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
                              controller.marketDetailEntity!.seriesName! + '  ',
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
                      '#${controller.marketDetailEntity!.good!.id!}/${controller.marketDetailEntity!.good!.totalNum!}',
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
                        controller.marketDetailEntity!.equityTypeDesc!,
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
                      controller.marketDetailEntity!.standard!,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'nft.detail.flag'.tr,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            controller.marketDetailEntity!.hash!,
                            maxLines: 1,
                            style:
                                const TextStyle(color: Colors.white, fontSize: 13, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  url: controller.marketDetailEntity!.good!.authorImage,
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
                            controller.marketDetailEntity!.good!.authorName!,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      'nft.detail.issuer'.tr +
                          controller.marketDetailEntity!.good!.issuer!,
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
                controller.marketDetailEntity!.good!.price!,
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
            ' ' + controller.marketDetailEntity!.good!.goodsName! + ' ',
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
              height: Get.width / 2,
              imageType: ImageType.assets,
            ),
            Container(
              width: Get.width,
              height: Get.width / 2,
              alignment: Alignment.bottomCenter,
              child: WrapperImage(
                url: 'nft_back_bottom.png',
                width: 320,
                height: 120,
                imageType: ImageType.assets,
              ),
            )
          ],
        ),
        Center(
          child: (controller.marketDetailEntity!.good!.threeD != '' &&
              controller.marketDetailEntity!.good!.threeD!.endsWith('gltf'))
              ? FutureBuilder(
            future: rootBundle.loadString("resource/model_html.html"),
            builder:
                (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.data != null &&
                  snapshot.connectionState == ConnectionState.done) {
                return Container(
                  child: _gltf(snapshot.data),
                );
              } else {
                return Container();
              }
            },
          )
              : Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 70),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(
                        3, 2, 0.0001) // 第三参数定义视图距离，值越小物体就离你越远，看着就有立体感
                  // 旋转Y轴角度，pi为圆半径，animation.value为动态获取的动画值
                    ..rotateY(pi * _animation.value / 180),
                  alignment: FractionalOffset.center, // 以轴中心开始动画
                  child: WrapperImage(
                    url: controller.marketDetailEntity!.good!.goodsImage,
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
                'market.detail.title'.tr,
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

  Widget _gltf(String? html) {
    if (html == null) {
      return Container();
    }
    html = html.replaceFirst("gltfUrl", controller.marketDetailEntity!.good!.threeD!);
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          Offstage(
            offstage: !controller.initGltf,
            child: SizedBox(
                width: Get.width,
                height: Get.width,
                child: const CupertinoActivityIndicator()),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              width: Get.width,
              height: Get.width,
              child: _web(html),
              // child: androidWeb(resizeTestBase64),
            ),
          ),
        ],
      ),
    );
  }

  Widget _web(String html) {
    return WebView(
      javascriptChannels: <JavascriptChannel>{
        JavascriptChannel(
            name: 'progress',
            onMessageReceived: (JavascriptMessage message) async {
              if (message.message.toString() == "1") {
                controller.gltfHasLoad();
              }
            }),
      },
      backgroundColor: Colors.transparent,
      initialUrl: Uri.dataFromString(html,
          mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString(),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  void dispose() {
// TODO: implement dispose
    _repeatController.dispose();
    super.dispose();
  }
}
