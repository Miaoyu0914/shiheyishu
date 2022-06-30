import 'package:get/get.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class MineController extends ViewStateController {
  LoginEntity? userInfo;
  List<String> menuTitleList = ['mine.3d.room'.tr,'mine.market.order'.tr,'mine.platform.order'.tr,'mine.donation'.tr,'mine.compose'.tr];
  List<String> menuImageList = ['mine_3d_room.png','mine_3d_room.png','mine_3d_room.png','mine_donation.png','mine_compose.png'];
  List<String> settingTitleList = ['mine.safe.setting'.tr,'mine.certification'.tr,'mine.logout'.tr];
  List<String> settingImageList = ['mine_safe_setting.png','mine_safe_setting.png','mine_logout.png'];

  @override
  void onInit() {
    super.onInit();
    userInfo = Constant.USERINFOVALUE;
  }

  void pushToWalletPage() {
    Get.toNamed(Routes.NAV+Routes.WALLET);
  }

  void pushToSettingPages(int index) {
    switch(index){
      case 0:
        Get.toNamed(Routes.NAV+Routes.SAFE);
        break;
      default:
        break;
    }
  }
}