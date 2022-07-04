import 'package:get/get.dart';
import 'package:shiheyishu/pages/blind_box/bindings/blind_box_bindings.dart';
import 'package:shiheyishu/pages/blind_box/views/blind_box_detail_page.dart';
import 'package:shiheyishu/pages/home/bindings/board_bindings.dart';
import 'package:shiheyishu/pages/home/bindings/board_detail_bindings.dart';
import 'package:shiheyishu/pages/home/bindings/nft_detail_bindings.dart';
import 'package:shiheyishu/pages/home/bindings/series_bindings.dart';
import 'package:shiheyishu/pages/home/views/board_detail_page.dart';
import 'package:shiheyishu/pages/home/views/board_page.dart';
import 'package:shiheyishu/pages/home/views/nft_detail_page.dart';
import 'package:shiheyishu/pages/home/views/series_page.dart';
import 'package:shiheyishu/pages/login/bindings/agreement_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/psw_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/register_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/splash_bindings.dart';
import 'package:shiheyishu/pages/login/views/agreement_page.dart';
import 'package:shiheyishu/pages/login/views/login_page.dart';
import 'package:shiheyishu/pages/login/views/psw_page.dart';
import 'package:shiheyishu/pages/login/views/register_page.dart';
import 'package:shiheyishu/pages/login/views/splash_page.dart';
import 'package:shiheyishu/pages/market/bindings/market_detail_bindings.dart';
import 'package:shiheyishu/pages/market/views/market_detail_page.dart';
import 'package:shiheyishu/pages/mine/bindings/account_privacy_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/market_rank_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_album_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_blind_box_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_blind_box_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_nft_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_nft_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/open_blind_box_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/real_name_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/reset_psw_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/safe_setting_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/share_rank_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/synthesis_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/synthesis_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_list_bindings.dart';
import 'package:shiheyishu/pages/mine/views/account_privacy_page.dart';
import 'package:shiheyishu/pages/mine/views/market_rank_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_album_list_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_blind_box_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_blind_box_list_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_nft_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_nft_list_page.dart';
import 'package:shiheyishu/pages/mine/views/open_blind_box_page.dart';
import 'package:shiheyishu/pages/mine/views/real_name_page.dart';
import 'package:shiheyishu/pages/mine/views/reset_psw_page.dart';
import 'package:shiheyishu/pages/mine/views/safe_setting_page.dart';
import 'package:shiheyishu/pages/mine/views/share_rank_page.dart';
import 'package:shiheyishu/pages/mine/views/synthesis_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/synthesis_list_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_list_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_page.dart';
import 'package:shiheyishu/pages/nav/bindings/nav_bar_bindings.dart';
import 'package:shiheyishu/pages/nav/views/nav_bar_page.dart';
import 'package:shiheyishu/pages/pay/bindings/pay_bindings.dart';
import 'package:shiheyishu/pages/pay/views/pay_page.dart';

import '../pages/login/bindings/login_bindings.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      bindings: [SplashBindings()],
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        bindings: [LoginBindings()],
        children: [
          GetPage(
            name: Routes.REGISTER,
            page: () => const RegisterPage(),
            bindings: [RegisterBindings()],
            children: [
              GetPage(
                name: Routes.AGREEMENT,
                page: () => const AgreementPage(),
                bindings: [AgreementBindings()],
              ),
            ]
          ),
          GetPage(
            name: Routes.FORGETPSW,
            page: () => const ForgetPswPage(),
            bindings: [ForgetPswBindings()],
          ),
        ]
    ),
    GetPage(
      name: Routes.NAV,
      page: () => const NavBarPage(),
      bindings: [NavBarBindings()],
      children: [
        GetPage(
            name: Routes.WALLET,
            page: () => const WalletPage(),
            bindings: [WalletBindings()],
            children: [
              GetPage(
                  name: Routes.WALLETLIST,
                  page: () => const WalletListPage(),
                  bindings: [WalletListBindings()],
              ),
            ]
        ),
        GetPage(
            name: Routes.BOARDLIST,
            page: () => const BoardPage(),
            bindings: [BoardBindings()],
            children: [
              GetPage(
                name: Routes.BOARDDETAIL,
                page: () => const BoardDetailPage(),
                bindings: [BoardDetailBindings()],
              ),
            ]
        ),
        GetPage(
            name: Routes.NFTDETAIL,
            page: () => const NFTDetailPage(),
            bindings: [NFTDetailBindings()],
            children: [

            ]
        ),
        GetPage(
            name: Routes.SAFE,
            page: () => const SafeSettingPage(),
            bindings: [SafeSettingBindings()],
            children: [
              GetPage(
                  name: Routes.RESETPSW,
                  page: () => const ResetPswPage(),
                  bindings: [ResetPswBindings()],
              ),
              GetPage(
                name: Routes.PRIVACY,
                page: () => const AccountPrivacyPage(),
                bindings: [AccountPrivacyBindings()],
              ),
            ]
        ),
        GetPage(
          name: Routes.REALNAME,
          page: () => const RealNamePage(),
          bindings: [RealNameBindings()],
        ),
        GetPage(
          name: Routes.SERIES,
          page: () => const SeriesPage(),
          bindings: [SeriesBindings()],
        ),
        GetPage(
          name: Routes.SHARERANK,
          page: () => const ShareRankPage(),
          bindings: [ShareRankBindings()],
        ),
        GetPage(
          name: Routes.MARKETRANK,
          page: () => const MarketRankPage(),
          bindings: [MarketRankBindings()],
        ),
        GetPage(
          name: Routes.SYNTHESISLIST,
          page: () => const SynthesisListPage(),
          bindings: [SynthesisListBindings()],
          children: [
            GetPage(
              name: Routes.SYNTHESISDETAIL,
              page: () => const SynthesisDetailPage(),
              bindings: [SynthesisDetailBindings()],
            ),
          ]
        ),
        GetPage(
          name: Routes.BLINDBOXDETAIL,
          page: () => const BlindBoxDetailPage(),
          bindings: [BlindBoxDetailBindings()],
        ),
        GetPage(
          name: Routes.MINEBLINDBOXLIST,
          page: () => const MineBlindBoxListPage(),
          bindings: [MineBlindBoxListBindings()],
          children: [
            GetPage(
              name: Routes.MINEBLINDBOXDETAIL,
              page: () => const MineBlindBoxDetailPage(),
              bindings: [MineBlindBoxDetailBindings()],
              children: [
                GetPage(
                  name: Routes.OPENBLINDBOX,
                  page: () => const OpenBlindBoxPage(),
                  bindings: [OpenBlindBoxBindings()],
                ),
              ]
            ),
          ]
        ),
        GetPage(
          name: Routes.MARKETDETAIL,
          page: () => const MarketDetailPage(),
          bindings: [MarketDetailBindings()],
        ),
        GetPage(
          name: Routes.PAY,
          page: () => const PayPage(),
          bindings: [PayBindings()],
        ),
        GetPage(
          name: Routes.MINENFTDETAIL,
          page: () => const MineNFTDetailPage(),
          bindings: [MineNFTDetailBindings()],
        ),
        GetPage(
          name: Routes.MINEALBUMLIST,
          page: () => const MineAlbumListPage(),
          bindings: [MineAlbumListBindings()],
          children: [
            GetPage(
              name: Routes.MINENFTLIST,
              page: () => const MineNFTListPage(),
              bindings: [MineNFTListBindings()],
            ),
          ]
        ),
      ]
    ),
  ];
}
