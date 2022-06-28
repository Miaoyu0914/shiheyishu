import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_entity.dart';
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
  BoardListEntity? boardListEntity;
  List<HomeAlbumEntity>? albums;
  List<HomeNftEntity>? hotNFTList;
  List<HomeNftEntity>? futureNFTList;
  int nftIndex = 0;
  int page = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    userInfo = Constant.USERINFOVALUE;
    await getHomeBanner();
    await getHomeBoard();
    await getHomeAlbum();
    await getNFTList();
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

  Future<void> getNFTList() async {
    hotNFTList = await NFTService.getNFTs(HttpRunnerParams(data: {
      "status": 0,
      "page": page
    }));
    futureNFTList = await NFTService.getNFTs(HttpRunnerParams(data: {
      "status": 1,
      "page": page
    }));
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
    update();
  }

  void pushToBoardListPage() {
    Get.toNamed(Routes.NAV+Routes.BOARDLIST);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}