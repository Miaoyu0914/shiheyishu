import 'package:flutter/animation.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/nft_detail_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class NFTDetailController extends ViewStateController {
  var id;
  NFTDetailController({required this.id});
  NftDetailEntity? nftDetailEntity;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setBusy();
    await getNFTDetail();
    setIdle();
  }

  Future<void> getNFTDetail() async {
    nftDetailEntity = await NFTService.getNFTDetail(HttpRunnerParams(data: {
      'id': id
    }));
  }
}