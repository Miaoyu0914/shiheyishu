import 'package:get/get.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class AccountPrivacyController extends ViewStateController {
  LoginEntity? userInfo;

  @override
  void onInit() {
    super.onInit();
    userInfo = Constant.USERINFOVALUE;
  }

  void pushToUserAgreementPage() {
    Get.toNamed(Routes.LOGIN + Routes.REGISTER + Routes.AGREEMENT,
        arguments: {'isUserAgreement': false});
  }
}
