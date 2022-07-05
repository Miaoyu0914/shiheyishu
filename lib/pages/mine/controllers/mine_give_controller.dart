import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_give_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineGiveController extends ViewStateController {
  MineGiveEntity? mineGiveEntity;
  List<Data> giveList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getGiveList();
    setIdle();
  }

  Future<void> getGiveList() async {
    mineGiveEntity = await NFTService.getGiveList(HttpRunnerParams());
    giveList.addAll(mineGiveEntity!.data!);
    if (mineGiveEntity!.data!.length < Constant.refreshListLimit) {
      isNotEnough = true;
    }
  }

  int page = 1;
  bool isNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void refreshList() async {
    giveList.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getGiveList();
    refreshController.refreshCompleted();
    if (isNotEnough) {
      refreshController.loadNoData();
    }
  }

  void loadMoreList() async {
    page++;
    await getGiveList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }
}
