import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(''.tr,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            switch(index){
              case 0:
                return _body();
              default:
                return Container();
            }
          },childCount: 1))
        ],
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        //
        Column(
          children: [

            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
            ),
          ],
        ),
      ],
    );
  }
}