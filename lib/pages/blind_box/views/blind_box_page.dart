import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/blind_box/controllers/blind_box_controller.dart';

class BlindBoxPage extends GetView<BlindBoxController> {
  const BlindBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('blind.box.title'.tr)
    );
  }
}