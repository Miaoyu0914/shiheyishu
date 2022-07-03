import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_blind_box_detail_controller.dart';

class MineBlindBoxDetailPage extends StatefulWidget {
  const MineBlindBoxDetailPage({Key? key}) : super(key: key);

  @override
  State<MineBlindBoxDetailPage> createState() => _MineBlindBoxDetailPageState();
}

class _MineBlindBoxDetailPageState extends State<MineBlindBoxDetailPage> with SingleTickerProviderStateMixin {
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
    return Container();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _repeatController.dispose();
    super.dispose();
  }
}
