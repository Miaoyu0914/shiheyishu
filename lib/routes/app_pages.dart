import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/bindings/home_bindings.dart';
import 'package:shiheyishu/pages/home/views/home_page.dart';
import 'package:shiheyishu/pages/login/bindings/psw_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/register_bindings.dart';
import 'package:shiheyishu/pages/login/bindings/splash_bindings.dart';
import 'package:shiheyishu/pages/login/views/login_page.dart';
import 'package:shiheyishu/pages/login/views/psw_page.dart';
import 'package:shiheyishu/pages/login/views/register_page.dart';
import 'package:shiheyishu/pages/login/views/splash_page.dart';

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
      name: Routes.HOME,
      page: () => const HomePage(),
      bindings: [HomeBindings()],
      children: [
        // GetPage(
        //   name: Routes.COUNTRY,
        //   page: () => CountryView(),
        //   children: [
        //     GetPage(
        //       name: Routes.DETAILS,
        //       page: () => DetailsView(),
        //     ),
        //   ],
        // ),
      ],
    ),
  ];
}
