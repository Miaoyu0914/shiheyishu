import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/entities/blind_box_list_entity.dart';
import 'package:shiheyishu/entities/board_detail_entity.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_list_entity.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/entities/market_nft_list_entity.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';
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
    return LoginEntity.fromJson(res.data);
  });

  //用户信息
  static final getUserInfo =
  buildHttpRunner<UserInfoEntity>((HttpRunnerParams params) async {
    var res = await request('/app/member/memberInfo', params);
    return UserInfoEntity.fromJson(res.data);
  });

  //首页轮播图
  static final getBanners =
  buildHttpRunner<List<HomeBannerEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/slider/sliderList', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return HomeBannerEntity.fromJson(e);
    }).toList();
  });

  //首页公告
  static final getBoards =
  buildHttpRunner<BoardListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/article/articleList', params);
    return BoardListEntity.fromJson(res.data);
  });

  //公告详情
  static final getBoardDetail =
  buildHttpRunner<BoardDetailEntity>((HttpRunnerParams params) async {
    var res = await request('/app/article/info', params);
    return BoardDetailEntity.fromJson(res.data);
  });

  //首页专辑
  static final getAlbums =
  buildHttpRunner<List<HomeAlbumEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/goods_series/homeSeriesList', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return HomeAlbumEntity.fromJson(e);
    }).toList();
  });

  //首页商品列表
  static final getNFTs =
  buildHttpRunner<HomeNftListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods/goodsList', params);
    return HomeNftListEntity.fromJson(res.data);
  });

  //盲盒列表
  static final getBlindBoxes =
  buildHttpRunner<List<BlindBoxListEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/blind_box/pageList', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return BlindBoxListEntity.fromJson(e);
    }).toList();
  });

  //市场列表
  static final getMarketNFTs =
  buildHttpRunner<MarketNftListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods_rent/marketList', params);
    return MarketNftListEntity.fromJson(res.data);
  });

  //钱包
  static final getWalletList =
  buildHttpRunner<WalletListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/balance_log/balanceList', params);
    return WalletListEntity.fromJson(res.data);
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
    EasyLoading.showError('http.error'.tr);
  });
  return res;
}
