import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  TextField(
                    controller: controller.phoneController,
                    cursorColor: Colors.white,
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
                    cursorColor: Colors.white,
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
                  InkWell(
                    onTap: () => controller.login(),
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
                      padding: const EdgeInsets.only(top: 16.5, bottom: 16.5),
                      margin: const EdgeInsets.only(top: 62, bottom: 42),
                      child: Text(
                        'login.button'.tr,
                        style: const TextStyle(
                            height: 1,
                            color: AppColors.loginButtonTitleColor,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => controller.pushToRegisterPage(),
                        child: Text(
                          'login.register'.tr,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const Text(
                        '  |  ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      InkWell(
                        onTap: () => controller.pushToForgetPswPage(),
                        child: Text(
                          'login.forget.psw'.tr,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
