import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isBusy) {
      // return ViewState
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
              child: Center(
                child: Text(
                  'login.title'.tr,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            WrapperImage(
              url: 'login_logo.png',
              imageType: ImageType.assets,
            ),
            WrapperImage(
              url: 'logowenzi.png',
              imageType: ImageType.assets,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
              padding: EdgeInsets.all(30),
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
              child: Column(
                children: [
                  TextField(
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: const EdgeInsets.all(12),
                        child: ImageIcon(
                          AssetImage(ImageHelper.wrapAssets('phone.png')),
                          color: Colors.white,
                        ),
                      ),
                      labelText: 'login.phone.hint'.tr,
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.loginTextFieldLineColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.loginTextFieldLineColor),
                      ),
                    ),
                  ),
                  TextField(
                    controller: controller.pswController,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: const EdgeInsets.all(12),
                        child: ImageIcon(
                          AssetImage(ImageHelper.wrapAssets('psw.png')),
                          color: Colors.white,
                        ),
                      ),
                      labelText: 'login.psw.hint'.tr,
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.loginTextFieldLineColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.loginTextFieldLineColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
