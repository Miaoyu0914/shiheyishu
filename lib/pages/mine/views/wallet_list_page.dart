import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/mine/controllers/wallet_list_controller.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';

class WalletListPage extends GetView<WalletListController> {
  const WalletListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletListController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        appBar: NormalAppBar(title: 'wallet.list.title'.tr).getAppBar(context),
        body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context,LoadStatus? mode){
                    return CommonUtils.refreshFooter(mode);
                  },
                ),
                controller: controller.refreshController,
                onRefresh: controller.refreshList,
                onLoading: controller.loadMoreList,
                child: CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                      switch (index) {
                        case 0:
                          return _body();
                        default:
                          return Container();
                      }
                    }, childCount: 1))
                  ],
                ),
              )
      );
    });
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: WrapperImage(url: 'wallet_list.png', width: 146, height: 146, imageType: ImageType.assets,),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            Data wallet = controller.wallets[index];
            return Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              padding: const EdgeInsets.all(15),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          wallet.remark!,
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        wallet.createTime!.split(' ')[0],
                        style: const TextStyle(
                            color: AppColors.nftUnselectColor, fontSize: 12),
                      )
                    ],
                  ),
                  Text(
                    wallet.amount!.startsWith('-')
                        ? wallet.amount!
                        : '+${wallet.amount!}',
                    style: const TextStyle(
                        color: AppColors.codeButtonTitleColor, fontSize: 18),
                  )
                ],
              ),
            );
          },
          itemCount: controller.wallets.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }
}