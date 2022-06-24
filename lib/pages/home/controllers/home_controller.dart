import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/board_list_entity.dart';
import 'package:shiheyishu/entities/home_banner_entity.dart';
import 'package:shiheyishu/entities/login_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class HomeController extends ViewStateController {
  LoginEntity? userInfo;
  List<HomeBannerEntity>? banners;
  Timer? _timer;
  PageController? bannerController;
  PageController? boardController;
  BoardListEntity? boardListEntity;
  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    userInfo = Constant.USERINFOVALUE;
    await getHomeBanner();
    await getHomeBoard();
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

  Future<void> initTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      bannerController?.animateToPage(((bannerController?.page?.toInt())! + 1), duration: const Duration(milliseconds: 300), curve: Curves.linear);
      boardController?.animateToPage(((boardController?.page?.toInt())! + 1), duration: const Duration(milliseconds: 300), curve: Curves.linear);
      update();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}