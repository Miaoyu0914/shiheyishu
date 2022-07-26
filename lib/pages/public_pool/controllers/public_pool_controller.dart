import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/public_article_list_entity.dart' as pa;
import 'package:shiheyishu/entities/public_pool_log_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class PublicPoolController extends ViewStateController {
  String? number = '';
  int tabIndex = 0;
  PublicPoolLogEntity? logEntity;
  pa.PublicArticleListEntity? articleListEntity;
  List<Data> logs = [];
  List<pa.Data> articles = [];
  int logPage = 1;
  int articlePage = 1;
  bool isLogNotEnough = false;
  bool isArticleNotEnough = false;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getPublicPoolNumber();
    await getPublicPoolLogList();
    await getPublicPoolArticleList();
    setIdle();
  }

  Future<void> getPublicPoolNumber() async {
    number = await NFTService.getPublicPoolNum(HttpRunnerParams());
  }

  Future<void> getPublicPoolLogList() async {
    logEntity = await NFTService.getPublicPoolList(
        HttpRunnerParams(data: {'page': logPage}));
    logs.addAll(logEntity!.data!);
    if (logEntity!.data!.length < Constant.refreshListLimit) {
      isLogNotEnough = true;
    }
  }

  Future<void> getPublicPoolArticleList() async {
    articleListEntity = await NFTService.getPublicArticleList(
        HttpRunnerParams(data: {'page': articlePage}));
    articles.addAll(articleListEntity!.data!);
    if (articleListEntity!.data!.length < Constant.refreshListLimit) {
      isArticleNotEnough = true;
    }
  }

  void tabClicked(int index) {
    tabIndex = index;
    if (index == 0) {
      if (isLogNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    } else {
      if (isArticleNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    }
    update();
  }

  void refreshList() async {
    if (tabIndex == 0) {
      logs.clear();
      logPage = 1;
      isLogNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getPublicPoolLogList();
      refreshController.refreshCompleted();
      if (isLogNotEnough) {
        refreshController.loadNoData();
      }
    } else {
      articles.clear();
      articlePage = 1;
      isArticleNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getPublicPoolArticleList();
      refreshController.refreshCompleted();
      if (isArticleNotEnough) {
        refreshController.loadNoData();
      }
    }
    update();
  }

  void loadMoreList() async {
    if (tabIndex == 0) {
      logPage++;
      await getPublicPoolLogList();
      if (isLogNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    } else {
      articlePage++;
      await getPublicPoolArticleList();
      if (isArticleNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }
    update();
  }

  void pushPublicArticleDetail(int index) {
    Get.toNamed(Routes.NAV + Routes.PUBLICPOOL + Routes.PUBLICPOOLARTICLE,
        arguments: {'id': articles[index].id});
  }
}
