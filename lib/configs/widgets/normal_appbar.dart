import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/widgets/image.dart';

class NormalAppBar {
  List<Widget>? actions;
  Color backgroundColor;
  Color titleColor;
  String? title;
  bool isBack;
  Widget? leading;
  bool isShowBack;
  bool isShowBottomLine;
  double? toolbarHeight;

  NormalAppBar({
    this.actions,
    this.backgroundColor = AppColors.main,
    this.titleColor = Colors.white,
    this.title,
    this.isBack = true,
    this.leading,
    this.isShowBack = true,
    this.isShowBottomLine = false,
    this.toolbarHeight,
  });

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: !isBack
          ? leading
          : isShowBack
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 22, left: 24, right: 24),
                    child: WrapperImage(
                      url: 'nav_back.png',
                      width: 8,
                      height: 12,
                      imageType: ImageType.assets,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : null,
      toolbarHeight: toolbarHeight,
      actions: actions,
      backgroundColor: backgroundColor,
      title: _getTitle(),
      centerTitle: false,
      bottom: isShowBottomLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: Container(
                color: AppColors.appBarLine,
                height: 1,
              ),
            )
          : null,
    );
  }

  _getTitle() {
    return Text(
      title.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
          color: titleColor, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
