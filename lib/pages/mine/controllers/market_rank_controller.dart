import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/market_rank_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MarketRankController extends ViewStateController {
  List<MarketRankEntity>? rankList;
  List<String> topImage = ['first.png', 'second.png', 'third.png'];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getMarketRankList();
    setIdle();
  }

  Future<void> getMarketRankList() async {
    rankList = await NFTService.getMarketRank(HttpRunnerParams());
  }
}
