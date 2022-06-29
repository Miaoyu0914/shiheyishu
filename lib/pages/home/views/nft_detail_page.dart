import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/home/controllers/nft_detail_controller.dart';

class NFTDetailPage extends StatefulWidget {
  const NFTDetailPage({Key? key}) : super(key: key);

  @override
  _NFTDetailPageState createState() => _NFTDetailPageState();
}

class _NFTDetailPageState extends State<NFTDetailPage> with TickerProviderStateMixin {
  late final AnimationController _repeatController;

  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repeatController = AnimationController(vsync: this, reverseDuration: const Duration(seconds: 5))..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_repeatController);
  }

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
                    default:
                      return Container();
                  }
                }, childCount: 1))
          ],
        ),
      );
    });
  }

  Widget _nftShow() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            WrapperImage(url: 'nft_back_top.png', width: Get.width, height: 200, imageType: ImageType.assets,),
            WrapperImage(url: 'nft_back_bottom.png', width: Get.width, height: 230,imageType: ImageType.assets,)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Transform(alignment: FractionalOffset.center, transform: Matrix4.identity()..setEntry(3, 2, 0.0015)..rotateY(pi * _animation.value),child: WrapperImage(url: 'splash.png', width: 200, height: 200, imageType: ImageType.assets,),),
          // child: RotationTransition(turns: _animation,child: WrapperImage(url: 'splash.png', width: 200, height: 200, imageType: ImageType.assets,)),
        )
      ],
    );
  }
}