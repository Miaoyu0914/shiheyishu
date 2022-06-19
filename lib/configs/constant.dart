import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/storage_manager.dart';

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
    TOKENVALUE = token;
  }

  static Future<String> getToken() async {
    final token = StorageManager.sharedPreferences?.getString(TOKEN) ?? "";
    if (!CommonUtils.strIsEmpty(token)) {
      TOKENVALUE = token;
    }
    return token;
  }

  //userID
  // ignore: constant_identifier_names
  static const String USERID = "USERID";
  // ignore: non_constant_identifier_names
  static String USERIDVALUE = "";

  static void setUSERIDVALUE({String? userID}) {
    if (!CommonUtils.strIsEmpty(userID!)) {
      StorageManager.sharedPreferences?.setString(USERID, userID);
    }
    USERIDVALUE = userID;
  }

  static Future<String> getUserID() async {
    final userID = StorageManager.sharedPreferences?.getString(USERID);
    if (!CommonUtils.strIsEmpty(userID!)) {
      USERIDVALUE = userID;
    }
    return userID;
  }

  static Future<void> constantInit() async {
    Constant.getToken();
    Constant.getUserID();
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

