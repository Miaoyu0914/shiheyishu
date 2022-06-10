import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CommonUtils {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static String trimSpace(String str) {
    String returnStr = str.trimLeft();
    returnStr = returnStr.trimRight();
    return returnStr;
  }

  static double getStatusBarHeight() {
    return MediaQueryData.fromWindow(window).padding.top;
  }

  static double getAppBarHeight() {
    return 56.0;
  }

  static double getTabBarHeight(BuildContext context) {
    return MediaQueryData.fromWindow(window).padding.bottom +
        (Platform.isIOS
            ? CommonUtils.getScreenSize(context).height == 812 ||
                    CommonUtils.getScreenSize(context).height == 896
                ? 49
                : 56
            : 57);
  }

  static bool strIsEmpty(String str) {
    return str == null || str == "" || !str.isNotEmpty || str == "null";
  }

  static bool objectIsNull(Object object) {
    if (object == null) return true;
    return false;
  }

  static bool objectIsEmpty(Object object) {
    if (objectIsNull(object)) return true;
    if ((object is String) && (object.isEmpty || object == "")){
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  //根据中文unicode范围判断u4e00 ~ u9fa5不全
  static bool _isChinese(String str) {
    String regEx1 = "[\\u4e00-\\uFA29]+";
    String regEx2 = "[\\uE7C7-\\uE7F3]+";
    String regEx3 = "[\\u2E80-\\u2EFF]+";
    String regEx4 = "[\\u3000-\\u303F]+";
    String regEx5 = "[\\u31C0-\\u31EF]+";

    return RegExp(regEx1).hasMatch(str) ||
        RegExp(regEx2).hasMatch(str) ||
        RegExp(regEx3).hasMatch(str) ||
        RegExp(regEx4).hasMatch(str) ||
        RegExp(regEx5).hasMatch(str);
  }
}
