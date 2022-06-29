import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/pages/home/controllers/board_controller.dart';

class BoardPage extends GetView<BoardController> {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
          appBar: NormalAppBar(title: 'board.title'.tr).getAppBar(context),
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                return CommonUtils.refreshFooter(mode);
              },
            ),
            controller: controller.refreshController,
            onRefresh: controller.refreshList,
            onLoading: controller.loadMoreList,
            child: CustomScrollView(
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
          ));
    });
  }

  Widget _body() {
    return ListView.builder(itemBuilder: (context,index){
      Data board = controller.boards[index];
      return InkWell(
        onTap: () => controller.pushToBoardDetailPage(index),
        child: Container(
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
            ]
          ),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          padding: const EdgeInsets.only(left: 10,right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              WrapperImage(url: 'horn.png',width: 40, height: 40,imageType: ImageType.assets,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(board.title!, maxLines: 1, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Text('${board.look}'+'board.look'.tr+' | '+'${board.time}', style: const TextStyle(color: AppColors.nftUnselectColor, fontSize: 11),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },itemCount: controller.boards.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),);
  }
}
