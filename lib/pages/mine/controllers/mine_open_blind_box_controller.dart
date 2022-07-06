import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_blind_box_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';

class MineOpenBlindBoxController extends ViewStateController {
  Data blindBox;
  MineOpenBlindBoxController({required this.blindBox});

  bool initGltf = true;

  @override
  void onInit() {
    super.onInit();
    
  }

  void gltfHasLoad() {
    initGltf = false;
    update();
  }

  void pushToMineNFTDetailPage() {
    Get.toNamed(Routes.NAV + Routes.MINENFTDETAIL, arguments: {'id': blindBox.id});
  }
}