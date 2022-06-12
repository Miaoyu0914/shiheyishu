import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(''.tr,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            switch(index){
              case 0:
                return Text("1111");
              default:
                return Container();
            }
          },childCount: 1))
        ],
      ),
    );
  }
}