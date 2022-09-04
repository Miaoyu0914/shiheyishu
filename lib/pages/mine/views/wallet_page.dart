import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/wallet_controller.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        appBar: NormalAppBar(
          title: 'wallet.title'.tr,
        ).getAppBar(context),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _top();
                case 1:
                  return _list();
                default:
                  return Container();
              }
            }, childCount: 2))
          ],
        ),
      );
    });
  }

  Widget _list() {
    if (controller.isEmpty) {
      return ViewStateEmptyWidget(
        'list.empty'.tr,
      );
    }
    return ListView.builder(
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
    );
  }

  Widget _top() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Text(
                      'wallet.money'.tr + controller.userInfoEntity!.balance!,
                      style: const TextStyle(
                          color: AppColors.codeButtonTitleColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Row(
                      children: [
                        Text(
                          'wallet.balance'.tr,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        InkWell(
                          onTap: () => controller.pushToChargePage(),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                                border: Border.all(
                                    color: AppColors.codeButtonTitleColor,
                                    width: 1)),
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 4, bottom: 4),
                            margin: const EdgeInsets.only(left: 13, right: 7),
                            child: Text(
                              'wallet.recharge'.tr,
                              style: const TextStyle(
                                  color: AppColors.codeButtonTitleColor,
                                  height: 1,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.pushToCashOutPage(),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                                border: Border.all(
                                    color: AppColors.codeButtonTitleColor,
                                    width: 1)),
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 4, bottom: 4),
                            child: Text(
                              'wallet.cash.out'.tr,
                              style: const TextStyle(
                                  color: AppColors.codeButtonTitleColor,
                                  height: 1,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              WrapperImage(
                url: 'wallet.png',
                width: 91,
                height: 106,
                imageType: ImageType.assets,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  WrapperImage(
                    url: 'diamonds.png',
                    width: 19,
                    height: 19,
                    imageType: ImageType.assets,
                  ),
                  Text(
                    'wallet.list.title'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              InkWell(
                onTap: () => controller.pushToWalletListPage(),
                child: Text(
                  'wallet.look.more'.tr,
                  style: const TextStyle(
                      color: AppColors.nftUnselectColor, fontSize: 15),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
