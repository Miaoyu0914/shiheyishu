import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/login/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<SplashController>();
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        WrapperImage(url: 'splash.png', width: Get.width, height: Get.height, imageType: ImageType.assets,),
        InkWell(
          onTap: (){
            controller.endCount();
          },
          child: Text("${controller.countNumber} S",style: const TextStyle(color: Colors.white,fontSize: 14),),
        )
      ],
    );
  }
}