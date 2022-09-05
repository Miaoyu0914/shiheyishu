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
import 'package:shiheyishu/pages/mine/bindings/cash_out_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/charge_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/give_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/market_rank_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_address_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_album_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_bank_card_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_blind_box_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_blind_box_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_give_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_info_change_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_market_order_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_market_order_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_nft_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_nft_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_open_blind_box_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_platform_order_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/mine_platform_order_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/pay_web_view_bindings.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_info_change_controller.dart';
import 'package:shiheyishu/pages/mine/views/cash_out_page.dart';
import 'package:shiheyishu/pages/mine/views/charge_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_info_change_page.dart';
import 'package:shiheyishu/pages/mine/views/pay_web_view_page.dart';
import 'package:shiheyishu/pages/public_pool/bindings/public_pool_article_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/real_name_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/resell_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/reset_psw_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/safe_setting_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/share_rank_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/synthesis_detail_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/synthesis_list_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/three_blindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_list_bindings.dart';
import 'package:shiheyishu/pages/mine/views/account_privacy_page.dart';
import 'package:shiheyishu/pages/mine/views/give_page.dart';
import 'package:shiheyishu/pages/mine/views/market_rank_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_address_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_album_list_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_bank_card_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_blind_box_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_blind_box_list_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_give_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_market_order_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_market_order_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_nft_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_nft_list_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_open_blind_box_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_platform_order_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_platform_order_page.dart';
import 'package:shiheyishu/pages/public_pool/views/public_pool_article_page.dart';
import 'package:shiheyishu/pages/mine/views/real_name_page.dart';
import 'package:shiheyishu/pages/mine/views/resell_page.dart';
import 'package:shiheyishu/pages/mine/views/reset_psw_page.dart';
import 'package:shiheyishu/pages/mine/views/safe_setting_page.dart';
import 'package:shiheyishu/pages/mine/views/share_rank_page.dart';
import 'package:shiheyishu/pages/mine/views/synthesis_detail_page.dart';
import 'package:shiheyishu/pages/mine/views/synthesis_list_page.dart';
import 'package:shiheyishu/pages/mine/views/three_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_list_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_page.dart';
import 'package:shiheyishu/pages/nav/bindings/nav_bar_bindings.dart';
import 'package:shiheyishu/pages/nav/views/nav_bar_page.dart';
import 'package:shiheyishu/pages/pay/bindings/pay_bindings.dart';
import 'package:shiheyishu/pages/pay/bindings/verify_bindings.dart';
import 'package:shiheyishu/pages/pay/views/pay_page.dart';
import 'package:shiheyishu/pages/pay/views/verify_page.dart';

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
      name: Routes.SLIDERVREIFY,
      page: () => const VerifyPage(),
      bindings: [VerifyBindings()],
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
          name: Routes.PUBLICPOOLARTICLE,
          page: () => const PublicPoolArticlePage(),
          bindings: [PublicPoolArticleBindings()],
        ),
        GetPage(
          name: Routes.CHANGEUSERINFO,
          page: () => const MineInfoChangePage(),
          bindings: [MineInfoChangeBindings()],
        ),
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
              GetPage(
                name: Routes.CHARGE,
                page: () => const ChargePage(),
                bindings: [ChargeBindings()],
                children: [
                  GetPage(
                    name: Routes.PAYWEBVIEW,
                    page: () => const PayWebViewPage(),
                    bindings: [PayWebViewBindings()],
                  ),
                ]
              ),
              GetPage(
                name: Routes.CASHOUT,
                page: () => const CashOutPage(),
                bindings: [CashOutBindings()],
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
            name: Routes.THREE,
            page: () => const ThreePage(),
            bindings: [ThreeBindings()],
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
                name: Routes.MINEBANKCARD,
                page: () => const MineBankCardPage(),
                bindings: [MineBankCardBindings()],
              ),
              GetPage(
                name: Routes.PRIVACY,
                page: () => const AccountPrivacyPage(),
                bindings: [AccountPrivacyBindings()],
              ),
              GetPage(
                name: Routes.MINEADDRESS,
                page: () => const MineAddressPage(),
                bindings: [MineAddressBindings()],
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
                  name: Routes.MINEBLINDBOXOPEN,
                  page: () => const MineOpenBlindBoxPage(),
                  bindings: [MineOpenBlindBoxBindings()],
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
          children: [
            GetPage(
              name: Routes.RESELL,
              page: () => const RESellPage(),
              bindings: [RESellBindings()],
            ),
            GetPage(
              name: Routes.GIVE,
              page: () => const GivePage(),
              bindings: [GiveBindings()],
            ),
          ]
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
        GetPage(
          name: Routes.MINEGIVELIST,
          page: () => const MineGivePage(),
          bindings: [MineGiveBindings()],
        ),
        GetPage(
          name: Routes.MINEPLATFORMORDERLIST,
          page: () => const MinePlatformOrderPage(),
          bindings: [MinePlatformOrderBindings()],
          children: [
            GetPage(
              name: Routes.MINEPLATFORMORDERDETAIL,
              page: () => const MinePlatformOrderDetailPage(),
              bindings: [MinePlatformOrderDetailBindings()],
            ),
          ]
        ),
        GetPage(
          name: Routes.MINEMARKETORDERLIST,
          page: () => const MineMarketOrderPage(),
          bindings: [MineMarketOrderBindings()],
          children: [
            GetPage(
              name: Routes.MINEPLATFORMORDERDETAIL,
              page: () => const MineMarketOrderDetailPage(),
              bindings: [MineMarketOrderDetailBindings()],
            ),
          ]
        ),
      ]
    ),
  ];
}
