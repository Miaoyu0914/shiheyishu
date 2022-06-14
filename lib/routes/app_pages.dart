import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/bindings/home_bindings.dart';
import 'package:shiheyishu/pages/home/views/home_page.dart';
import 'package:shiheyishu/pages/login/bindings/splash_bindings.dart';
import 'package:shiheyishu/pages/login/views/splash_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page:() => const SplashPage(),bindings: [SplashBindings()],),
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
