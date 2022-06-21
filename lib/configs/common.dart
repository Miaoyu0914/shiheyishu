import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return str == "" || !str.isNotEmpty || str == "null";
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

  static RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

  static bool isPhoneNumber(String phoneNumber) {
    bool matched = exp.hasMatch(phoneNumber);
    return matched;
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

class ImageHelper {
  // static String requestBaseUrl = Env.getApiOptions(ApiName.DEFAULT).baseUrl;
  // static String wikiBaseUrl = requestBaseUrl+'/wiki/attachment/downloadFile?id=';
  // static String portalBaseUrl = requestBaseUrl+'/portal/attachment/downloadFile?id=';
  // static const String baseUrl = 'http://www.meetingplus.cn';
  // static const String imagePrefix = '$baseUrl/uimg/';
  //
  // static String wrapUrl(String url) {
  //   if (url.startsWith('http')) {
  //     return url;
  //   } else {}
  //   return imagePrefix + url;
  // }

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }

  static Widget placeHolder({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: CupertinoActivityIndicator(radius: min(10.0, width! / 3)));
  }

  static Widget error({double? width, double? height, double? size}) {
    return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.error_outline,
          size: size,
        ));
  }
}

