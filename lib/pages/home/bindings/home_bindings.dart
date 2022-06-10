import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}