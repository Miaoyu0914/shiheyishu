import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/mine_nft_detail_entity.dart';
import 'package:shiheyishu/entities/share_qr_code_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MineNFTDetailController extends ViewStateController {
  var id;

  MineNFTDetailController({required this.id});

  MineNftDetailEntity? mineNftDetailEntity;
  ShareQrCodeEntity? shareQrCodeEntity;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getMineNFTDetail();
    await getShareQRCode();
    setIdle();
  }

  Future<void> getMineNFTDetail() async {
    mineNftDetailEntity = await NFTService.getMineNFTDetail(
        HttpRunnerParams(data: {'space_id': id}));
  }

  Future<void> getShareQRCode() async {
    shareQrCodeEntity = await NFTService.getShareQRCode(HttpRunnerParams());
  }

  void pushToSeriesPage() {
    Get.toNamed(Routes.NAV + Routes.SERIES,
        arguments: {'id': mineNftDetailEntity!.good!.seriesId});
  }

  bool initGltf = true;

  void gltfHasLoad() {
    initGltf = false;
    update();
  }

  void pushToGivePage() {
    Get.toNamed(Routes.NAV + Routes.MINENFTDETAIL + Routes.GIVE,
        arguments: {'id': id});
  }

  void pushToSellPage() {
    Get.toNamed(Routes.NAV + Routes.MINENFTDETAIL + Routes.RESELL, arguments: {
      'id': id,
      'image': mineNftDetailEntity!.good!.goodsImage,
      'name': mineNftDetailEntity!.good!.goodsName,
      'hash': mineNftDetailEntity!.hash
    });
  }
}
