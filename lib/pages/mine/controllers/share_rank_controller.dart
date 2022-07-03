import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/share_rank_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class ShareRankController extends ViewStateController {
  List<ShareRankEntity>? rankList;
  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getShareRankList();
    setIdle();
  }

  Future<void> getShareRankList() async {
    rankList = await NFTService.getShareRank(HttpRunnerParams());
  }

}