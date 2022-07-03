import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class BlindBoxDetailController extends ViewStateController {
  var id;
  BlindBoxDetailController({required this.id});
  BlindBoxDetailEntity? blindBoxDetailEntity;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getBlindBoxDetail();
    setIdle();
  }

  Future<void> getBlindBoxDetail() async {
    blindBoxDetailEntity = await NFTService.getBlindBoxDetail(HttpRunnerParams(
      data: {
        'id': id
      }
    ));
  }

}