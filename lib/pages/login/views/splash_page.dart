import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/login/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        WrapperImage(url: 'splash.png', width: Get.width, height: Get.height,imageType: ImageType.assets,),
        InkWell(
          onTap: () {
            controller.endCount();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 30),
            child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.black9,
                    borderRadius: BorderRadius.all(Radius.circular(17))),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Text(
                  'splash.jump'.tr + " ${controller.countNumber}",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )),
          ),
        )
      ],
    );
  }
}
