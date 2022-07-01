import 'package:get/get.dart';
import 'package:shiheyishu/pages/login/controllers/agreement_controller.dart';

class AgreementBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgreementController(isUserAgreement: Get.arguments['isUserAgreement']));
  }
}