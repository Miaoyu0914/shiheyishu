import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if(controller.isBusy){
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        appBar: AppBar(
          title: Center(child: Text('home'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
          leadingWidth: 0,
          leading: Container(),
          backgroundColor: AppColors.main,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _banner();
                case 1:
                  return _board();
                default:
                  return Container();
              }
            }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _board() {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: AppColors.borderInsideColor,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
              inset: true
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WrapperImage(url: 'board.png',imageType: ImageType.assets, width: 86,height: 35,),
              Container(
                width: 150,
                child: PageView.builder(itemBuilder: (context,index){
                  return Center(child: Text(controller.boardListEntity!.data![index].title!,style: const TextStyle(color: Colors.white,fontSize: 14),));
                },controller: controller.boardController,itemCount: controller.boardListEntity!.data!.length,scrollDirection: Axis.vertical,),
              )
            ],
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.5)),
                  border: Border.all(color: AppColors.navSelectedTitleColor,width: 1)
              ),
              padding: const EdgeInsets.only(top: 2,bottom: 2,left: 11,right: 11),
              margin: const EdgeInsets.only(right: 15),
              child: Text('home.more'.tr, style: const TextStyle(color: AppColors.navSelectedTitleColor,fontSize: 13,height: 1),),
            ),
          )
        ],
      ),
    );
  }

  Widget _banner() {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(15),
      child: PageView.builder(itemBuilder: (context,index){
        return InkWell(
          child: WrapperImage(url: controller.banners![index].imagePath),
        );
      },itemCount: controller.banners!.length,controller: controller.bannerController,)
    );
  }
}