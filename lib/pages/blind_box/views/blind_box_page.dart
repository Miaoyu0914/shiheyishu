import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/blind_box_list_entity.dart';
import 'package:shiheyishu/pages/blind_box/controllers/blind_box_controller.dart';

class BlindBoxPage extends GetView<BlindBoxController> {
  const BlindBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlindBoxController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        appBar: AppBar(
          title: Center(
              child: Text(
            'mine.blind.box'.tr,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
          leadingWidth: 0,
          leading: Container(),
          backgroundColor: AppColors.main,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _blindBoxList();
                default:
                  return Container();
              }
            }, childCount: 1))
          ],
        ),
      );
    });
  }

  Widget _blindBoxList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 2,
            //纵轴间距
            mainAxisSpacing: 15.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 0.55),
        itemBuilder: (context, index) {
          BlindBoxListEntity blindBox = controller.blindBoxes![index];
          return InkWell(
            onTap: () => controller.pushBlindBoxDetailPage(index),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: WrapperImage(
                              url: blindBox.image,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: 0.3,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 15, right: 20, left: 20),
                                decoration: BoxDecoration(
                                    color: AppColors.blindBoxTitleBackColor,
                                    border: Border.all(
                                        color:
                                            AppColors.blindBoxTitleBorderColor,
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                blindBox.name!,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    height: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'blind.box.creator'.tr,
                              style: const TextStyle(
                                  color: AppColors.nftUnselectColor,
                                  fontSize: 10),
                            ),
                            Text(
                              blindBox.authorName!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                'blind.box.issuer'.tr,
                                style: const TextStyle(
                                    color: AppColors.nftUnselectColor,
                                    fontSize: 10),
                              ),
                              Text(
                                blindBox.issuer!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'blind.box.amount'.tr,
                              style: const TextStyle(
                                  color: AppColors.nftUnselectColor,
                                  fontSize: 10),
                            ),
                            Text(
                              '${blindBox.num}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                            Text(
                              'blind.box.sale'.tr,
                              style: const TextStyle(
                                  color: AppColors.nftUnselectColor,
                                  fontSize: 10),
                            ),
                            Text(
                              '${blindBox.sale}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                'blind.box.money'.tr,
                                style: const TextStyle(
                                    color: AppColors.codeButtonTitleColor,
                                    fontSize: 16),
                              ),
                              Text(
                                blindBox.price!,
                                style: const TextStyle(
                                    color: AppColors.codeButtonTitleColor,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: controller.blindBoxes!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 126, left: 15, right: 15));
  }
}
