import 'dart:convert';

import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/storage_manager.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/services/api/nft_api.dart';

abstract class Constant {
  // host
  static const String host = 'http://ytsk.p1.sdqttx.net:91';         //test
  // static const String host = 'http://ytsk.p1.sdqttx.net:91';         //prod

  //APP_VERSION
  static const String appVersion = "1.0.0";

  //APP_NAME
  static const String appName = "世禾艺术";

  //REFRESH_LIST_LIMIT
  static const int refreshListLimit = 10;

  //Token
  // ignore: constant_identifier_names
  static const String TOKEN = "TOKEN";
  // ignore: non_constant_identifier_names
  static String TOKENVALUE = "";


  static void setTOKENVALUE({String? token}) async {
    if (!CommonUtils.strIsEmpty(token!)) {
      StorageManager.sharedPreferences?.setString(TOKEN, token);
    }
    nftApi.options.headers["token"] = token;
    TOKENVALUE = token;
  }

  static Future<String> getToken() async {
    final token = StorageManager.sharedPreferences?.getString(TOKEN) ?? "";
    if (!CommonUtils.strIsEmpty(token)) {
      TOKENVALUE = token;
    }
    return token;
  }

  //userInfo
  // ignore: constant_identifier_names
  static const String USERINFO = "USERINFO";
  // ignore: non_constant_identifier_names
  static LoginEntity? USERINFOVALUE;

  static void setUSERINFOVALUE({LoginEntity? loginEntity}) {
    StorageManager.sharedPreferences?.setString(USERINFO, jsonEncode(loginEntity).toString());
    USERINFOVALUE = loginEntity;
  }

  static Future<LoginEntity> getUserInfo() async {
    Map<String,dynamic> data = jsonDecode(StorageManager.sharedPreferences!.getString(USERINFO)!);
    LoginEntity userInfo = LoginEntity.fromJson(data);
    USERINFOVALUE = userInfo;
    return userInfo;
  }

  static Future<void> constantInit() async {
    Constant.getToken();
    Constant.getUserInfo();
  }

  static final Map<String, ApiConstant> apiSettings = {
    'platform': ApiConstant(
        baseUrl: host + 'api/platform/',
        headers: {
          'Content-type': 'application/json',
          "Authorization": "Bearer ${Constant.TOKENVALUE}"
        },
        connectTimeout: 30000,
        receiveTimeout: 30000),
    'nft': ApiConstant(
        baseUrl: host + 'api/cop/',
        headers: {
          'Content-type': 'application/json'
        },
        connectTimeout: 30000,
        receiveTimeout: 30000),
  };
}

class ApiConstant {
  final String? baseUrl;
  final int? connectTimeout;
  final int? receiveTimeout;
  final Map<String, String>? headers;

  ApiConstant(
      {this.baseUrl, this.connectTimeout, this.receiveTimeout, this.headers});
}

