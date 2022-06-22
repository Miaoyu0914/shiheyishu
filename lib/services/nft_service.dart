import 'package:dio/src/response.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/services/api/nft_api.dart';
import 'package:shiheyishu/services/http/http_runner.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';

abstract class NFTService {
  //验证码
  static final sendSms = buildHttpRunner<bool>((HttpRunnerParams params) async {
    var res = await request('/app/auth/sendSms', params);
    return res.success;
  });

  //登录
  static final login =
      buildHttpRunner<LoginEntity>((HttpRunnerParams params) async {
    var res = await request('/app/auth/login', params);
    // var res = await nftApi.post('/app/auth/login', data: params.data);
    return LoginEntity.fromJson(res.data);
  });
//
// //
// static final wikiAddFavoriteService = buildHttpRunner<bool>((
//     HttpRunnerParams params) async {
//   await request('/wiki/reaction/addFavorite', params);
//   return true;
// });
}

dynamic request(String url, HttpRunnerParams params) async {
  var res = await nftApi
      .post(
    url,
    data: params.data,
    cancelToken: params.cancelToken,
  )
      .catchError((error) {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  });
  return res;
}
