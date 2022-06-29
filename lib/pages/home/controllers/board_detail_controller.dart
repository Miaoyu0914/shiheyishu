import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_detail_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class BoardDetailController extends ViewStateController {
  var id;
  BoardDetailController({required this.id});
  BoardDetailEntity? boardDetailEntity;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getBoardDetail();
    setIdle();
  }

  Future<void> getBoardDetail() async {
    boardDetailEntity = await NFTService.getBoardDetail(HttpRunnerParams(data: {
      'id': id
    }));
  }

}