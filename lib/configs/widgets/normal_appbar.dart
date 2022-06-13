import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';

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

  NormalAppBar(
      {this.actions,
      this.backgroundColor: Colors.white,
      this.titleColor: AppColors.main,
      this.title,
      this.isBack: true,
      this.leading,
      this.isShowBack: true,
      this.isShowBottomLine: true,
      this.toolbarHeight,});

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
                  child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.main,
                          size: 22,
                        ),
                      )),
                )
              : null,
      toolbarHeight: toolbarHeight,
      actions: actions,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: _getTitle(),
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
      style: TextStyle(color: titleColor, fontSize: 18),
    );
  }
}
