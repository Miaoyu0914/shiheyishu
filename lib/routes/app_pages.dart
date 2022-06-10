import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/bindings/home_bindings.dart';
import 'package:shiheyishu/pages/home/views/home_page.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
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
