import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      bindings: [HomeBinding()],
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
