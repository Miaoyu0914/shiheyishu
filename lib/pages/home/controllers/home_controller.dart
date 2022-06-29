import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_list_entity.dart' as bl;
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_list_entity.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class HomeController extends ViewStateController {
  LoginEntity? userInfo;
  List<HomeBannerEntity>? banners;
  Timer? _timer;
  PageController? bannerController = PageController();
  PageController? boardController = PageController();
  PageController? nftController = PageController();
  bl.BoardListEntity? boardListEntity;
  List<HomeAlbumEntity>? albums;
  List<Data> hotNFTList = [];
  List<Data> futureNFTList = [];
  HomeNftListEntity? hotNFTEntity;
  HomeNftListEntity? futureNFTEntity;
  int nftIndex = 0;
  int hotPage = 1;
  int futurePage = 1;
  bool isHotNotEnough = false;
  bool isFutureNotEnough = false;
  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    userInfo = Constant.USERINFOVALUE;
    await getHomeBanner();
    await getHomeBoard();
    await getHomeAlbum();
    await getHotNFTList();
    await getFutureNFTList();
    await initTimer();
    setIdle();
  }

  Future<void> getHomeBanner() async {
    banners = await NFTService.getBanners(HttpRunnerParams());
  }

  Future<void> getHomeBoard() async {
    boardListEntity = await NFTService.getBoards(HttpRunnerParams(data: {
      "page": 1
    }));
  }

  Future<void> getHomeAlbum() async {
    albums = await NFTService.getAlbums(HttpRunnerParams());
  }

  Future<void> getHotNFTList() async {
    hotNFTEntity = await NFTService.getNFTs(HttpRunnerParams(data: {
      "status": 0,
      "page": hotPage
    }));
    hotNFTList.addAll(hotNFTEntity!.data!);
    if (hotNFTEntity!.data!.length < Constant.refreshListLimit) {
      isHotNotEnough = true;
    }
  }

  Future<void> getFutureNFTList() async {
    futureNFTEntity = await NFTService.getNFTs(HttpRunnerParams(data: {
      "status": 1,
      "page": futurePage
    }));
    futureNFTList.addAll(futureNFTEntity!.data!);
    if (futureNFTEntity!.data!.length < Constant.refreshListLimit) {
      isFutureNotEnough = true;
    }
  }

  Future<void> initTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if(bannerController!.positions.isNotEmpty){
        if(bannerController!.page!.toInt() < banners!.length - 1){
          bannerController?.animateToPage((bannerController!.page!.toInt()) + 1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
        }else{
          bannerController?.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
        }
      }

      if(boardController!.positions.isNotEmpty){
        if(boardController!.page!.toInt() < boardListEntity!.data!.length - 1){
          boardController?.animateToPage(((boardController?.page?.toInt())! + 1), duration: const Duration(milliseconds: 300), curve: Curves.linear);
        }else{
          boardController?.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
        }
      }

      update();
    });
  }

  void tabClicked(int index) {
    nftIndex = index;
    nftController?.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    if(index == 0){
      if(isHotNotEnough){
        refreshController.loadNoData();
      }else{
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    }else{
      if(isFutureNotEnough){
        refreshController.loadNoData();
      }else{
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      }
    }
    update();
  }

  void refreshList() async {
    if(nftIndex == 0){
      hotNFTList.clear();
      hotPage = 1;
      isHotNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getHotNFTList();
      refreshController.refreshCompleted();
      if (isHotNotEnough) {
        refreshController.loadNoData();
      }
    }else{
      futureNFTList.clear();
      futurePage = 1;
      isFutureNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getFutureNFTList();
      refreshController.refreshCompleted();
      if (isFutureNotEnough) {
        refreshController.loadNoData();
      }
    }
    update();
  }

  void loadMoreList() async {
    if(nftIndex == 0){
      hotPage++;
      await getHotNFTList();
      if (isHotNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }else{
      futurePage++;
      await getFutureNFTList();
      if (isFutureNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }
    update();
  }

  void pushToBoardListPage() {
    Get.toNamed(Routes.NAV+Routes.BOARDLIST);
  }

  void pushToBoardDetailPage(int index) {
    Get.toNamed(Routes.NAV+Routes.BOARDLIST+Routes.BOARDDETAIL, arguments: {'id': boardListEntity!.data![index].id});
  }

  void pushToNFTDetailPage(var id){
    Get.toNamed(Routes.NAV+Routes.NFTDETAIL, arguments: {'id': id});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}