import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_blind_box_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineBlindBoxListController extends ViewStateController {
  int tabIndex = 0;
  MineBlindBoxListEntity? alreadyBlindBoxEntity;
  MineBlindBoxListEntity? futureBlindBoxEntity;
  List<Data> alreadyBlindBoxes = [];
  List<Data> futureBlindBoxes = [];
  int alreadyPage = 1;
  int futurePage = 1;
  bool isAlreadyNotEnough = false;
  bool isFutureNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  PageController? pageController = PageController();

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getOpenAlready();
    await getOpenFuture();
    setIdle();
  }

  Future<void> getOpenAlready() async {
    alreadyBlindBoxEntity = await NFTService.getMineBlindBoxList(
        HttpRunnerParams(data: {'open': 1}));
    alreadyBlindBoxes.addAll(alreadyBlindBoxEntity!.data!);
    if (alreadyBlindBoxEntity!.data!.length < Constant.refreshListLimit) {
      isAlreadyNotEnough = true;
    }
  }

  Future<void> getOpenFuture() async {
    futureBlindBoxEntity = await NFTService.getMineBlindBoxList(
        HttpRunnerParams(data: {'open': 0}));
    futureBlindBoxes.addAll(futureBlindBoxEntity!.data!);
    if (futureBlindBoxEntity!.data!.length < Constant.refreshListLimit) {
      isFutureNotEnough = true;
    }
  }

  void tabClicked(int index) {
    tabIndex = index;
    if (index == 0) {
      if (isAlreadyNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    } else {
      if (isFutureNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    }
    update();
    pageController?.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  void refreshList() async {
    if (tabIndex == 0) {
      alreadyBlindBoxes.clear();
      alreadyPage = 1;
      isAlreadyNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getOpenAlready();
      refreshController.refreshCompleted();
      if (isAlreadyNotEnough) {
        refreshController.loadNoData();
      }
    } else {
      futureBlindBoxes.clear();
      futurePage = 1;
      isFutureNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getOpenFuture();
      refreshController.refreshCompleted();
      if (isFutureNotEnough) {
        refreshController.loadNoData();
      }
    }
    update();
  }

  void loadMoreList() async {
    if (tabIndex == 0) {
      alreadyPage++;
      await getOpenAlready();
      if (isAlreadyNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    } else {
      futurePage++;
      await getOpenFuture();
      if (isFutureNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }
    update();
  }

  void pushToBlindBoxDetail(int index) {
    Get.toNamed(Routes.NAV+Routes.MINEBLINDBOXDETAIL, arguments: {'id': futureBlindBoxes[index].box!.id, 'isOpen': index == 0});
  }
}
