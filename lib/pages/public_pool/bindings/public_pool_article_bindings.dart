import 'package:get/get.dart';
import 'package:shiheyishu/pages/public_pool/controllers/public_pool_article_controller.dart';

class PublicPoolArticleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublicPoolArticleController(id: Get.arguments['id']));
  }
}