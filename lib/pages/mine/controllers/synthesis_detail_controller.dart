import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/synthesis_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class SynthesisDetailController extends ViewStateController {
  SynthesisListEntity? synthesisListEntity;
  SynthesisDetailController({required this.synthesisListEntity});

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> synthesisGoods() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.goSynthesis(HttpRunnerParams(data: {
      'id': synthesisListEntity!.id
    }));
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showSuccess('synthesis.task.success'.tr);
      Get.back();
    }
  }

}