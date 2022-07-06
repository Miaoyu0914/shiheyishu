import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';
import 'package:shiheyishu/entities/mine_blind_box_list_entity.dart';

class MineBlindBoxDetailController extends ViewStateController {
  Data blindBox;
  bool isOpen = false;
  MineBlindBoxDetailController({required this.blindBox, required this.isOpen});
  BlindBoxDetailEntity? blindBoxDetailEntity;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getBlindBoxDetail();
    setIdle();
  }

  Future<void> getBlindBoxDetail() async {
    blindBoxDetailEntity = await NFTService.getBlindBoxDetail(HttpRunnerParams(
        data: {
          'id': blindBox.id
        }
    ));
  }

  Future<void> openBlindBox() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.openBlindBox(HttpRunnerParams());
    EasyLoading.dismiss();
    if(isSuccess!){
      isOpen = true;
      Get.toNamed(Routes.MINEBLINDBOXOPEN, arguments: {'blind_box': blindBox});
    }
  }

}