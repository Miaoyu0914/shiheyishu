import 'package:flutter/widgets.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/album_detail_entity.dart';
import 'package:shiheyishu/entities/album_detail_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class SeriesController extends ViewStateController {
  var id;
  SeriesController({required this.id});
  AlbumDetailEntity? albumDetailEntity;
  List<List<AlbumDetailListEntity>?>? albumGoods = [[],[],[]];
  int seriesIndex = 0;
  PageController? pageController = PageController();

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getAlbumDetail();
    await getAlbumDetailGoodList(0);
    await getAlbumDetailGoodList(1);
    await getAlbumDetailGoodList(2);
    setIdle();
  }

  Future<void> getAlbumDetail() async {
    albumDetailEntity = await NFTService.getAlbumDetail(HttpRunnerParams(
      data: {
        'id': id
      }
    ));
  }

  Future<void> getAlbumDetailGoodList(int index) async {
    albumGoods?[index] = await NFTService.getAlbumDetailList(HttpRunnerParams(
      data: {
        'id': id,
        'status': getStatus(index)
      }
    ));
  }

  int getStatus(int index) {
    switch(index){
      case 0:
        return 2;
      case 1:
        return 1;
      case 2:
        return 3;
      default:
        return 1;
    }
  }

  void tabClicked(int index) {
    seriesIndex = index;
    pageController?.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    update();
  }
}