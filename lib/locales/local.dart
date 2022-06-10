import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/locales/local_en_US.dart';
import 'package:shiheyishu/locales/local_zh_CN.dart';

class LocalService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
