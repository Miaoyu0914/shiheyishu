import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_open_blind_box_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MineOpenBlindBoxPage extends StatefulWidget {
  const MineOpenBlindBoxPage({Key? key}) : super(key: key);

  @override
  _MineOpenBlindBoxPageState createState() => _MineOpenBlindBoxPageState();
}

class _MineOpenBlindBoxPageState extends State<MineOpenBlindBoxPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _repeatController;

  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repeatController =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 360.0).animate(_repeatController);
  }

  final controller = Get.find<MineOpenBlindBoxController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineOpenBlindBoxController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar:
            NormalAppBar(title: 'blind.box.detail.open'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _nftShow();
                case 1:
                  return _buttons();
                default:
                  return Container();
              }
            }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: AppColors.codeButtonTitleColor, width: 1)
                  ),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 16.5, bottom: 16.5, left: 50, right: 50),
              child: Text('blind.box.detail.back'.tr,
                style: const TextStyle(
                    height: 1,
                    color: AppColors.codeButtonTitleColor,
                    fontSize: 17),
              ),
            ),
          ),
          InkWell(
            onTap: () => controller.pushToMineNFTDetailPage(),
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
              padding: const EdgeInsets.only(top: 16.5, bottom: 16.5,left: 50, right: 50),
              child: Text('blind.box.detail.look'.tr,
                style: const TextStyle(
                    height: 1,
                    color: AppColors.loginButtonTitleColor,
                    fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nftShow() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.rankBackColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: (controller.blindBox.good!.threeD != '' &&
                    controller.blindBox.good!.threeD!.endsWith('gltf'))
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
                : AnimatedBuilder(
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
                          url: controller.blindBox.good!.goodsImage,
                          width: 180,
                          height: 180,
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: WrapperImage(
              url: 'nft_back_bottom.png',
              width: 320,
              height: 120,
              imageType: ImageType.assets,
            ),
          )
        ],
      ),
    );
  }

  Widget _gltf(String? html) {
    if (html == null) {
      return Container();
    }
    html = html.replaceFirst("gltfUrl", controller.blindBox.good!.threeD!);
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
