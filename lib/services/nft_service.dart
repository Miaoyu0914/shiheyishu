import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/entities/album_detail_entity.dart';
import 'package:shiheyishu/entities/album_detail_list_entity.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/entities/blind_box_list_entity.dart';
import 'package:shiheyishu/entities/board_detail_entity.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_list_entity.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/entities/market_detail_entity.dart';
import 'package:shiheyishu/entities/market_nft_list_entity.dart';
import 'package:shiheyishu/entities/market_rank_entity.dart';
import 'package:shiheyishu/entities/mine_album_list_entity.dart';
import 'package:shiheyishu/entities/mine_blind_box_list_entity.dart';
import 'package:shiheyishu/entities/mine_give_entity.dart';
import 'package:shiheyishu/entities/mine_platform_order_entity.dart';
import 'package:shiheyishu/entities/nft_detail_entity.dart';
import 'package:shiheyishu/entities/share_rank_entity.dart';
import 'package:shiheyishu/entities/synthesis_list_entity.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';
import 'package:shiheyishu/services/api/nft_api.dart';
import 'package:shiheyishu/services/http/http_runner.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';

abstract class NFTService {
  //验证码
  static final sendSMS = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/auth/sendSms', params);
    return true;
  });

  //注册
  static final register = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/auth/register', params);
    return true;
  });

  //用户使用手册
  static final getUserAgreement =
  buildHttpRunner<String>((HttpRunnerParams params) async {
    var res = await request('/app/auth/yhxy', params);
    return res.data['content'];
  });

  //隐私政策
  static final getPrivacyAgreement =
  buildHttpRunner<String>((HttpRunnerParams params) async {
    var res = await request('/app/auth/privacy', params);
    return res.data['content'];
  });

  //忘记密码
  static final changePSW = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/auth/forgetPassword', params);
    return true;
  });

  //修改登录密码
  static final resetPSW = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/member/editPassword', params);
    return true;
  });

  //修改支付密码
  static final resetSecondPSW = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/member/editSecondPassword', params);
    return true;
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

  //专辑详情
  static final getAlbumDetail =
  buildHttpRunner<AlbumDetailEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods_series/seriesDetail', params);
    return AlbumDetailEntity.fromJson(res.data);
  });

  //专辑详情列表
  static final getAlbumDetailList =
  buildHttpRunner<List<AlbumDetailListEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/goods_series/seriesGoods', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return AlbumDetailListEntity.fromJson(e);
    }).toList();
  });

  //首页商品列表
  static final getNFTs =
  buildHttpRunner<HomeNftListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods/goodsList', params);
    return HomeNftListEntity.fromJson(res.data);
  });

  //首页商品详情
  static final getNFTDetail =
  buildHttpRunner<NftDetailEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods/goodsInfo', params);
    return NftDetailEntity.fromJson(res.data);
  });

  //nft下单
  static final createNFTOrder =
  buildHttpRunner<String?>((HttpRunnerParams params) async {
    var res = await request('/app/goods_orders/createOrder', params);
    return res.data['order_sn'];
  });

  //nft支付
  static final payNFTOrder = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/goods_orders/pay', params);
    return true;
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

  //盲盒详情
  static final getBlindBoxDetail =
  buildHttpRunner<BlindBoxDetailEntity>((HttpRunnerParams params) async {
    var res = await request('/app/blind_box/info', params);
    return BlindBoxDetailEntity.fromJson(res.data);
  });

  //盲盒下单
  static final createBlindBoxOrder =
  buildHttpRunner<String?>((HttpRunnerParams params) async {
    var res = await request('/app/blind_box_orders/createOrder', params);
    return res.data['order_sn'];
  });

  //盲盒支付
  static final payBlindBoxOrder = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/blind_box_orders/pay', params);
    return true;
  });

  //我的盲盒列表
  static final getMineBlindBoxList =
  buildHttpRunner<MineBlindBoxListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/blind_box_orders/myBoxes', params);
    return MineBlindBoxListEntity.fromJson(res.data);
  });

  //开盲盒
  static final openBlindBox = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/blind_box_orders/openBoxes', params);
    return true;
  });

  //市场列表
  static final getMarketNFTs =
  buildHttpRunner<MarketNftListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods_rent/marketList', params);
    return MarketNftListEntity.fromJson(res.data);
  });

  //市场商品详情
  static final getMarketDetail =
  buildHttpRunner<MarketDetailEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods_rent/info', params);
    return MarketDetailEntity.fromJson(res.data);
  });

  //市场下单
  static final createMarketOrder =
  buildHttpRunner<String?>((HttpRunnerParams params) async {
    var res = await request('/app/rent_orders/createOrder', params);
    return res.data['order_sn'];
  });

  //市场支付
  static final payMarketOrder = buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/rent_orders/pay', params);
    return true;
  });

  //钱包
  static final getWalletList =
  buildHttpRunner<WalletListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/balance_log/balanceList', params);
    return WalletListEntity.fromJson(res.data);
  });

  //我的系列
  static final getMineAlbum =
  buildHttpRunner<MineAlbumListEntity>((HttpRunnerParams params) async {
    var res = await request('/app/member_space/seriesList', params);
    return MineAlbumListEntity.fromJson(res.data);
  });

  //我的系列商品
  // static final getMineNFTList =
  // buildHttpRunner<MineAlbumListEntity>((HttpRunnerParams params) async {
  //   var res = await request('/app/member_space/goodsList', params);
  //   return MineAlbumListEntity.fromJson(res.data);
  // });

  //平台订单
  static final getPlatformOrderList =
  buildHttpRunner<MinePlatformOrderEntity>((HttpRunnerParams params) async {
    var res = await request('/app/goods_orders/orderList', params);
    return MinePlatformOrderEntity.fromJson(res.data);
  });

  //转增记录
  static final getGiveList =
  buildHttpRunner<MineGiveEntity>((HttpRunnerParams params) async {
    var res = await request('/app/member_space/transferLog', params);
    return MineGiveEntity.fromJson(res.data);
  });

  //个人中心大图
  static final getMineImage =
  buildHttpRunner<String?>((HttpRunnerParams params) async {
    var res = await request('/app/slider/my', params);
    return res.data.first['image_path'];
  });

  //实名认证
  static final getRealName =
  buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/member_real/submit', params);
    return true;
  });

  //直推排行
  static final getShareRank =
  buildHttpRunner<List<ShareRankEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/member/directRank', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return ShareRankEntity.fromJson(e);
    }).toList();
  });

  //二级市场排行
  static final getMarketRank =
  buildHttpRunner<List<MarketRankEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/member/marketRank', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return MarketRankEntity.fromJson(e);
    }).toList();
  });

  //合成列表
  static final getSynthesisList =
  buildHttpRunner<List<SynthesisListEntity>>((HttpRunnerParams params) async {
    var res = await request('/app/synthetic_goods/goodsList', params);
    List<dynamic> data = res.data;
    return data.map((e){
      return SynthesisListEntity.fromJson(e);
    }).toList();
  });

  //去合成
  static final goSynthesis =
  buildHttpRunner<bool>((HttpRunnerParams params) async {
    await request('/app/member_space/synthetic', params);
    return true;
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
