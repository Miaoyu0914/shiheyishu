import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class BoardController extends ViewStateController {
  BoardListEntity? boardListEntity;
  List<Data> boards = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getBoards();
  }

  Future<void> getBoards() async {
    boardListEntity = await NFTService.getBoards(HttpRunnerParams(data: {
      'page':page
    }));
    boards.addAll(boardListEntity!.data!);
    if (boards.isNotEmpty) {
      if (boardListEntity!.data!.length < Constant.refreshListLimit) {
        isNotEnough = true;
      }
      setIdle();
    } else {
      setEmpty();
    }
  }

  int page = 1;
  bool isNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void refreshList() async {
    boards.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);

    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.refreshCompleted();
    }
  }

  void loadMoreList() async {
    page++;

    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }
}
