import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_goods_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineNFTListController extends ViewStateController {
  var id;

  MineNFTListController({required this.id});

  MineGoodsListEntity? mineGoodsListEntity;
  List<Data> goods = [];
  int page = 1;
  bool isNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getGoodsList();
    setIdle();
  }

  Future<void> getGoodsList() async {
    mineGoodsListEntity = await NFTService.getMineGoodsList(
        HttpRunnerParams(data: {'goods_id': id}));
    goods.addAll(mineGoodsListEntity!.data!);
    if (mineGoodsListEntity!.data!.length < Constant.refreshListLimit) {
      isNotEnough = true;
    }
  }

  void refreshList() async {
    goods.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getGoodsList();
    refreshController.refreshCompleted();
    if (isNotEnough) {
      refreshController.loadNoData();
    }
  }

  void loadMoreList() async {
    page++;
    await getGoodsList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  void pushToGoodDetailPage(int index) {
    Get.toNamed(Routes.NAV + Routes.MINENFTDETAIL, arguments: {'id': goods[index].id});
  }
}
