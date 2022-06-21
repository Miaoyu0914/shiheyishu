import 'package:shiheyishu/configs/state/view_state_controller.dart';

class NavBarController extends ViewStateController {
  int? clickedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    print('tab');
  }

  void changeNavBarIndex(int index) {
    clickedIndex = index;
    update();
  }

}