import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/nft_detail_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
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

  void pushToSeriesPage() {
    Get.toNamed(Routes.NAV + Routes.SERIES,
        arguments: {'id': nftDetailEntity!.seriesId});
  }

  Future<void> pushToPayPage() async {
    if(nftDetailEntity!.status == 2){
      Get.toNamed(Routes.SLIDERVREIFY);
      // EasyLoading.show();
      // String? orderSn = await NFTService.createNFTOrder(
      //     HttpRunnerParams(
      //         data: {
      //           'goods_id': nftDetailEntity!.id
      //         }
      //     )
      // );
      // EasyLoading.dismiss();
      // if(orderSn != ''){
      //   Get.toNamed(Routes.NAV+Routes.PAY, arguments: {
      //     'orderSn': orderSn,
      //     'payType': 0,
      //     'entity': nftDetailEntity
      //   });
      // }
    }
  }

  bool initGltf = true;

  void gltfHasLoad() {
    initGltf = false;
    update();
  }
}