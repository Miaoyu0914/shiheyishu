import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class WalletListController extends ViewStateController {
  WalletListEntity? walletListEntity;
  List<Data> wallets = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getWalletList();
  }

  Future<void> getWalletList() async {
    walletListEntity = await NFTService.getWalletList(HttpRunnerParams(data: {
      "page": page,
    }));
    wallets.addAll(walletListEntity!.data!);
    if (wallets.isNotEmpty) {
      if (walletListEntity!.data!.length < Constant.refreshListLimit) {
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
    wallets.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getWalletList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.refreshCompleted();
    }
  }

  void loadMoreList() async {
    page++;
    await getWalletList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }
}
