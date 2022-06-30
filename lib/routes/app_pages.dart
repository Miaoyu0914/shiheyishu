import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/bindings/board_bindings.dart';
import 'package:shiheyishu/pages/home/bindings/board_detail_bindings.dart';
import 'package:shiheyishu/pages/home/bindings/nft_detail_bindings.dart';
import 'package:shiheyishu/pages/home/views/board_detail_page.dart';
import 'package:shiheyishu/pages/home/views/board_page.dart';
import 'package:shiheyishu/pages/home/views/nft_detail_page.dart';
import 'package:shiheyishu/pages/login/bindings/psw_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/register_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/splash_bindings.dart';
import 'package:shiheyishu/pages/login/views/login_page.dart';
import 'package:shiheyishu/pages/login/views/psw_page.dart';
import 'package:shiheyishu/pages/login/views/register_page.dart';
import 'package:shiheyishu/pages/login/views/splash_page.dart';
import 'package:shiheyishu/pages/mine/bindings/safe_setting_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_bindings.dart';
import 'package:shiheyishu/pages/mine/bindings/wallet_list_bindings.dart';
import 'package:shiheyishu/pages/mine/views/safe_setting_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_list_page.dart';
import 'package:shiheyishu/pages/mine/views/wallet_page.dart';
import 'package:shiheyishu/pages/nav/bindings/nav_bar_bindings.dart';
import 'package:shiheyishu/pages/nav/views/nav_bar_page.dart';

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

            ]
        ),
      ]
    ),
  ];
}
