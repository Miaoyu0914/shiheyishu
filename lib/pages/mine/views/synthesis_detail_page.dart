import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/synthesis_list_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/synthesis_detail_controller.dart';

class SynthesisDetailPage extends StatefulWidget {
  const SynthesisDetailPage({Key? key}) : super(key: key);

  @override
  State<SynthesisDetailPage> createState() => _SynthesisDetailPageState();
}

class _SynthesisDetailPageState extends State<SynthesisDetailPage>
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

  final controller = Get.find<SynthesisDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SynthesisDetailController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar:
            NormalAppBar(title: 'synthesis.task.title'.tr).getAppBar(context),
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: WrapperImage(
                  url: 'nft_back_bottom.png',
                  width: 320,
                  height: 120,
                  imageType: ImageType.assets,
                ),
              ),
              Center(
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
                        url: controller.synthesisListEntity!.goodsImage,
                        width: 180,
                        height: 180,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Center(
            child: WrapperImage(
              url: 'synthesis_arrow.png',
              width: 90,
              height: 120,
              imageType: ImageType.assets,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WrapperImage(
                url: 'diamonds.png',
                width: 20,
                height: 20,
                imageType: ImageType.assets,
              ),
              Text(
                'synthesis.task.data'.tr,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              WrapperImage(
                url: 'diamonds.png',
                width: 20,
                height: 20,
                imageType: ImageType.assets,
              ),
            ],
          ),
          SizedBox(
            height: ((Get.width - 15) / 3 - 15) * 2,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25),
              itemBuilder: (context, index) {
            Detail detail = controller.synthesisListEntity!.detail![index];
            return Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: WrapperImage(
                      url: detail.goodsImage,
                      width: (Get.width - 15) / 3 - 15,
                      height: (Get.width - 15) / 3 - 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      detail.goodsName!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      WrapperImage(
                        url: 'star.png',
                        width: 10,
                        height: 10,
                        imageType: ImageType.assets,
                      ),
                      Text(
                        ' X${detail.num}',
                        style: const TextStyle(
                            color: AppColors.codeButtonTitleColor,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            );
              },
              itemCount: controller.synthesisListEntity!.detail!.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          InkWell(
            onTap: () => controller.synthesisGoods(),
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
              margin: const EdgeInsets.only(left: 54, right: 54, bottom: 20),
              child: Text(
                'synthesis.task.button'.tr,
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

  @override
  void dispose() {
    // TODO: implement dispose
    _repeatController.dispose();
    super.dispose();
  }
}
