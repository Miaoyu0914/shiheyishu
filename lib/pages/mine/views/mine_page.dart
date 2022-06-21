import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_controller.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('mine.title'.tr)
    );
  }
}