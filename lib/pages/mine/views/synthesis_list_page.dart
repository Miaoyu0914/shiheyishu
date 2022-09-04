import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/synthesis_list_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/synthesis_list_controller.dart';

class SynthesisListPage extends GetView<SynthesisListController> {
  const SynthesisListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SynthesisListController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'synthesis.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
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
      );
    });
  }

  Widget _body() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
            crossAxisCount: 2,
            //纵轴间距
            mainAxisSpacing: 15.0,
            //横轴间距
            crossAxisSpacing: 10.0,
            //子组件宽高长度比例
            childAspectRatio: 0.65),
        itemBuilder: (context, index) {
          SynthesisListEntity synthesisListEntity = controller.synthesisList![index];
          return Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: WrapperImage(
                      url: synthesisListEntity.goodsImage,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(synthesisListEntity.goodsName!, style: const TextStyle(color: Colors.white, fontSize: 13),),
                      ),
                      InkWell(
                        onTap: () => controller.pushToDetailPage(index),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.loginButtonLeftColor,
                                    AppColors.loginButtonRightColor
                                  ])),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(left: 30,right: 30),
                          child: Text(
                            'synthesis.task.button'.tr,
                            style: const TextStyle(
                                height: 1,
                                color: AppColors.loginButtonTitleColor,
                                fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: controller.synthesisList!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
    );
  }
}