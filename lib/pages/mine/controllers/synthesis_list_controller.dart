import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/synthesis_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class SynthesisListController extends ViewStateController {
  List<SynthesisListEntity>? synthesisList;
  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getSynthesisList();
    setIdle();
  }

  Future<void> getSynthesisList() async {
    synthesisList = await NFTService.getSynthesisList(HttpRunnerParams());
  }

  void pushToDetailPage(int index) {
    Get.toNamed(Routes.NAV+Routes.SYNTHESISLIST+Routes.SYNTHESISDETAIL, arguments: {'entity': synthesisList![index]});
  }
}