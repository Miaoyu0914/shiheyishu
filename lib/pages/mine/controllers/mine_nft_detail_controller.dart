import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
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

  void showShareImageSheet(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return WillPopScope(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              margin: EdgeInsets.only(left: (Get.width - 300) / 2, right: (Get.width - 300) / 2, top: 15, bottom: 15),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: WrapperImage(
                        url: mineNftDetailEntity!.good!.shareImg,
                        width: 300,
                        height: 450,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mineNftDetailEntity!.good!.goodsName!,
                              style: const TextStyle(
                                  color: AppColors.shareTitleColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '限量：${mineNftDetailEntity!.good!.totalNum}份',
                                    style: const TextStyle(
                                        color: AppColors.shareLimitColor,
                                        fontSize: 12),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6)),
                                        border: Border.all(
                                            color: AppColors.codeButtonTitleColor,
                                            width: 1)),
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    alignment: Alignment.center,
                                    child: Text(
                                      mineNftDetailEntity!.good!.seriesName!,
                                      style: const TextStyle(
                                          color: AppColors.codeButtonTitleColor,
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                                  child: WrapperImage(
                                    url: mineNftDetailEntity!.good!.authorImage,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(mineNftDetailEntity!.good!.authorName!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: WrapperImage(
                                url: shareQrCodeEntity!.img,
                                width: 55,
                                height: 55,
                              ),
                            ),
                            Text(
                              'mine.nft.detail.share.download'.tr,
                              style: const TextStyle(
                                  color: AppColors.downloadAppTag, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onWillPop: () async => pop(),
        );
      },
    );
  }

  Future<bool> pop() async {
    return true;
  }
}
