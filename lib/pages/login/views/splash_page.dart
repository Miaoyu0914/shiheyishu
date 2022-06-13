import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<>();
    return Scaffold(
      appBar: AppBar(
        title: Text(,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            switch(index){
              case 0:
                return ;
              default:
                return Container();
            }
          },childCount: ))
        ],
      ),
    );
  }
}