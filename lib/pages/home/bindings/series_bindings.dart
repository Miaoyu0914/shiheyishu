import 'package:get/get.dart';
import 'package:shiheyishu/pages/home/controllers/series_controller.dart';

class SeriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeriesController(id: Get.arguments['id']));
  }
}