import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_list_entity.dart' as bl;
import 'package:shiheyishu/entities/download_entity.dart';
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/home_nft_list_entity.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends ViewStateController {
  LoginEntity? userInfo;
  List<HomeBannerEntity>? banners;
  Timer? _timer;
  PageController? bannerController = PageController();
  PageController? boardController = PageController();
  PageController? nftController = PageController();
  DownloadEntity? downloadEntity;
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
    await getDownloadInfo();
    await getHomeBanner();
    await getHomeBoard();
    await getHomeAlbum();
    await getHotNFTList();
    await getFutureNFTList();
    await initTimer();
    setIdle();
  }

  Future<void> getDownloadInfo() async {
    downloadEntity = await NFTService.getDownloadInfo(HttpRunnerParams());
    String currentAppVersion = await CommonUtils.getVersionName();
    String appVersion = '';
    if(Platform.isIOS){
      appVersion = downloadEntity!.iosVersion;
    }else{
      appVersion = downloadEntity!.version!;
    }
    if(currentAppVersion != appVersion){
      showDialog<bool>(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text('update.title'.tr),
            titlePadding: const EdgeInsets.all(10),
            titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            content: Text('update.content'.trParams({'version': appVersion})),
            contentPadding: const EdgeInsets.all(10),
            contentTextStyle: const TextStyle(color: AppColors.black6, fontSize: 16),
            actions: <Widget>[
              TextButton(
                child: Text('update.button.title'.tr, style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 16),),
                onPressed: () {
                  if(Platform.isIOS){
                    _gotoAppStore();
                  }else{
                    _launchInBrowser();
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> getHomeBanner() async {
    banners = await NFTService.getBanners(HttpRunnerParams());
  }

  Future<void> getHomeBoard() async {
    boardListEntity =
        await NFTService.getBoards(HttpRunnerParams(data: {"page": 1}));
  }

  Future<void> getHomeAlbum() async {
    albums = await NFTService.getHomeAlbums(HttpRunnerParams());
  }

  Future<void> getHotNFTList() async {
    hotNFTEntity = await NFTService.getNFTs(
        HttpRunnerParams(data: {"status": 0, "page": hotPage}));
    hotNFTList.addAll(hotNFTEntity!.data!);
    if (hotNFTEntity!.data!.length < Constant.refreshListLimit) {
      isHotNotEnough = true;
    }
  }

  Future<void> getFutureNFTList() async {
    futureNFTEntity = await NFTService.getNFTs(
        HttpRunnerParams(data: {"status": 1, "page": futurePage}));
    futureNFTList.addAll(futureNFTEntity!.data!);
    if (futureNFTEntity!.data!.length < Constant.refreshListLimit) {
      isFutureNotEnough = true;
    }
  }

  Future<void> initTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (bannerController!.positions.isNotEmpty) {
        if (bannerController!.page!.toInt() < banners!.length - 1) {
          bannerController?.animateToPage((bannerController!.page!.toInt()) + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else {
          bannerController?.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        }
      }

      if (boardController!.positions.isNotEmpty) {
        if (boardController!.page!.toInt() <
            boardListEntity!.data!.length - 1) {
          boardController?.animateToPage(
              ((boardController?.page?.toInt())! + 1),
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        } else {
          boardController?.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        }
      }

      update();
    });
  }

  void tabClicked(int index) {
    nftIndex = index;
    nftController?.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    if (index == 0) {
      if (isHotNotEnough) {
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
  }

  void refreshList() async {
    if (nftIndex == 0) {
      hotNFTList.clear();
      hotPage = 1;
      isHotNotEnough = false;
      refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
      await getHotNFTList();
      refreshController.refreshCompleted();
      if (isHotNotEnough) {
        refreshController.loadNoData();
      }
    } else {
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
    if (nftIndex == 0) {
      hotPage++;
      await getHotNFTList();
      if (isHotNotEnough) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    } else {
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
    Get.toNamed(Routes.NAV + Routes.BOARDLIST);
  }

  void pushToBoardDetailPage(int index) {
    Get.toNamed(Routes.NAV + Routes.BOARDLIST + Routes.BOARDDETAIL,
        arguments: {'id': boardListEntity!.data![index].id});
  }

  void pushToNFTDetailPage(var id) {
    Get.toNamed(Routes.NAV + Routes.NFTDETAIL, arguments: {'id': id});
  }

  void pushToAlbumPage(var id) {
    Get.toNamed(Routes.NAV + Routes.SERIES, arguments: {'id': id});
  }

  Future<void> _gotoAppStore() async {
    if (!await launch(
        'itms-apps://itunes.apple.com/app/id1604338868'
    )) {
      throw 'Could not update';
    }
  }

  Future<void> _launchInBrowser() async {
    if (!await launch(
      downloadEntity!.download!,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not update';
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
