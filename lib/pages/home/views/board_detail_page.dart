import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/home/controllers/board_detail_controller.dart';

class BoardDetailPage extends GetView<BoardDetailController> {
  const BoardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardDetailController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'board.detail.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
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
      );
    });
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: AppColors.borderInsideColor,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 1,
                inset: true),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${controller.boardDetailEntity!.title}',
            style: const TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 29),
            child: Text(
              '${controller.boardDetailEntity!.time}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Offstage(
            offstage: controller.boardDetailEntity!.smallText == '',
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Text(
                '${controller.boardDetailEntity!.smallText}',
                style: const TextStyle(color: AppColors.black9, fontSize: 15),
              ),
            ),
          ),
          HtmlWidget(
            controller.boardDetailEntity!.content!,
            textStyle: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
