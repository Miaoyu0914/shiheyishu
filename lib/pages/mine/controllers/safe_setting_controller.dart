import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class SafeSettingController extends ViewStateController {
  List<String> menuTitles = [
    'safe.reset.psw'.tr,
    'safe.reset.second.psw'.tr,
    'safe.set.card'.tr,
    'safe.set.account'.tr,
    'mine.address.title'.tr
  ];
  List<String> menuImages = [
    'reset_psw.png',
    'reset_psw.png',
    'safe_card.png',
    'safe_account.png',
    'safe_account.png'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void pushToSafeSettingPages(int index) {
    switch(index){
      case 0:
        Get.toNamed(Routes.NAV+Routes.SAFE+Routes.RESETPSW, arguments: {'isLoginPsw':true});
        break;
      case 1:
        Get.toNamed(Routes.NAV+Routes.SAFE+Routes.RESETPSW, arguments: {'isLoginPsw':false});
        break;
      case 2:
        Get.toNamed(Routes.NAV+Routes.SAFE+Routes.MINEBANKCARD);
        break;
      case 3:
        Get.toNamed(Routes.NAV+Routes.SAFE+Routes.PRIVACY);
        break;
      case 4:
        Get.toNamed(Routes.NAV+Routes.SAFE+Routes.MINEADDRESS);
        break;
      default:
        break;
    }
  }
}
