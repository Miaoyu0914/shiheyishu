import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_market_order_controller.dart';

class MineMarketOrderPage extends GetView<MineMarketOrderController> {
  const MineMarketOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineMarketOrderController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'platform.order.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Container(
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
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  // Text('platform.order.all'.tr, style: TextStyle(color: controller.tabIndex == 0 ? ),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}