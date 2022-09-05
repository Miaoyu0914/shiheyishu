import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_market_order_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineMarketOrderController extends ViewStateController {
  int tabIndex = 0;
  MineMarketOrderEntity? payOrderEntity;
  MineMarketOrderEntity? alreadyOrderEntity;
  MineMarketOrderEntity? cancelOrderEntity;
  List<Data> payOrders = [];
  List<Data> alreadyOrders = [];
  List<Data> cancelOrders = [];
  int payOrderPage = 1;
  int alreadyOrderPage = 1;
  int cancelOrderPage = 1;
  bool isAllNotEnough = false;
  bool isPayNotEnough = false;
  bool isAlreadyNotEnough = false;
  bool isCancelNotEnough = false;
  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getPayOrder();
    await getAlreadyOrder();
    await getCancelOrder();
    setIdle();
  }

  Future<void> getPayOrder() async {
    payOrderEntity = await NFTService.getMarketInOrderList(
        HttpRunnerParams(data: {'status': 0}));
    payOrders.addAll(payOrderEntity!.data!);
    if (payOrderEntity!.data!.length < Constant.refreshListLimit) {
      isPayNotEnough = true;
    }
  }

  Future<void> getAlreadyOrder() async {
    alreadyOrderEntity = await NFTService.getMarketInOrderList(
        HttpRunnerParams(data: {'status': 1}));
    alreadyOrders.addAll(alreadyOrderEntity!.data!);
    if (alreadyOrderEntity!.data!.length < Constant.refreshListLimit) {
      isAlreadyNotEnough = true;
    }
  }

  Future<void> getCancelOrder() async {
    cancelOrderEntity = await NFTService.getMarketInOrderList(
        HttpRunnerParams(data: {'status': -1}));
    cancelOrders.addAll(cancelOrderEntity!.data!);
    if (cancelOrderEntity!.data!.length < Constant.refreshListLimit) {
      isCancelNotEnough = true;
    }
  }

  void refreshList() async {
    switch (tabIndex) {
      case 0:
        await refreshPayOrderList();
        break;
      case 1:
        await refreshAlreadyOrderList();
        break;
      case 2:
        await refreshCancelOrderList();
        break;
      default:
        break;
    }
  }

  Future<void> refreshPayOrderList() async {
    payOrders.clear();
    payOrderPage = 1;
    isPayNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getPayOrder();
    refreshController.refreshCompleted();
    if (isPayNotEnough) {
      refreshController.loadNoData();
    }
  }

  Future<void> refreshAlreadyOrderList() async {
    alreadyOrders.clear();
    alreadyOrderPage = 1;
    isAlreadyNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getAlreadyOrder();
    refreshController.refreshCompleted();
    if (isAlreadyNotEnough) {
      refreshController.loadNoData();
    }
  }

  Future<void> refreshCancelOrderList() async {
    cancelOrders.clear();
    cancelOrderPage = 1;
    isCancelNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getCancelOrder();
    refreshController.refreshCompleted();
    if (isCancelNotEnough) {
      refreshController.loadNoData();
    }
  }

  void loadMoreList() async {
    switch (tabIndex) {
      case 0:
        await loadPayOrderList();
        break;
      case 1:
        await loadAlreadyOrderList();
        break;
      case 2:
        await loadCancelOrderList();
        break;
      default:
        break;
    }
  }

  Future<void> loadPayOrderList() async {
    payOrderPage++;
    await getPayOrder();
    if (isPayNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  Future<void> loadAlreadyOrderList() async {
    alreadyOrderPage++;
    await getAlreadyOrder();
    if (isAlreadyNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  Future<void> loadCancelOrderList() async {
    cancelOrderPage++;
    await getCancelOrder();
    if (isCancelNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  void tabClicked(int index) {
    tabIndex = index;
    update();
  }

  int getListCount() {
    switch(tabIndex){
      case 0:
        return payOrders.length;
      case 1:
        return alreadyOrders.length;
      case 2:
        return cancelOrders.length;
      default:
        return 0;
    }
  }

  Data getPlatformOrderData(int index) {
    switch(tabIndex){
      case 0:
        return payOrders[index];
      case 1:
        return alreadyOrders[index];
      case 2:
        return cancelOrders[index];
      default:
        return payOrders[index];
    }
  }

  String getStatusString(int status) {
    switch(status){
      case -1:
        return 'platform.order.cancel'.tr;
      case 0:
        return 'platform.order.future.pay'.tr;
      case 1:
        return 'platform.order.already'.tr;
      default:
        return '';
    }
  }

  void gotoPay(Data data) {
    Get.toNamed(Routes.NAV+Routes.PAY, arguments: {
      'orderSn': data.orderSn,
      'payType': 3,
      'entity': data
    });
  }

  void gotoDetail(Data data) {
    Get.toNamed(Routes.NAV + Routes.MINEMARKETORDERLIST + Routes.MINEMARKETORDERDETAIL, arguments: {
      'data': data,
    });
  }

}