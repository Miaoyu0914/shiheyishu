import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';

class NavBarController extends ViewStateController {
  int currentIndex = 0;
  List<String> navTitles = [
    'home.title'.tr,
    'blind.box.title'.tr,
    'public.pool'.tr,
    'market.title'.tr,
    'mine.title'.tr
  ];
  List<String> navNormalIcons = [
    'home.png',
    'blind_box.png',
    'public_pool.png',
    'market.png',
    'mine.png'
  ];
  List<String> navSelectedIcons = [
    'home_selected.png',
    'blind_box_selected.png',
    'public_pool.png',
    'market_selected.png',
    'mine_selected.png'
  ];

  @override
  void onInit() {
    super.onInit();
    print('tab');
  }

  void changeNavBarIndex(int index) {
    currentIndex = index;
    update();
  }
}
