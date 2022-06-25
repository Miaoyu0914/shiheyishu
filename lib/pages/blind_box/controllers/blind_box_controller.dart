import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/blind_box_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class BlindBoxController extends ViewStateController {
  List<BlindBoxListEntity>? blindBoxes;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getBlindBoxList();
    setIdle();
  }

  Future<void> getBlindBoxList() async {
    blindBoxes = await NFTService.getBlindBoxes(HttpRunnerParams());
  }
}