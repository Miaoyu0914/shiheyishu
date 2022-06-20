import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/login/controllers/psw_controller.dart';

class ForgetPswPage extends GetView<ForgetPswController> {
  const ForgetPswPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isBusy) {
      return ViewStateBusyWidget();
    }
    return Scaffold(
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
  }

  Widget _body() {
    return Stack(
      children: [
        WrapperImage(
          url: 'liuxing.png',
          width: Get.width,
          height: Get.height / 5 * 2,
          imageType: ImageType.assets,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: CommonUtils.getAppBarHeight(), bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  ),
                  Text(
                    'login.forget.psw'.tr,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 30, bottom: 65),
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.loginTopColor,
                      AppColors.loginBottomColor
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}