import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Center(
      child: Text(controller.title),
    );
  }
}