import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class AgreementController extends ViewStateController {
  bool isUserAgreement;
  AgreementController({required this.isUserAgreement});
  String? content = "";

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setBusy();
    await getContent();
    setIdle();
  }

  Future<void> getContent() async {
    if(isUserAgreement){
      content = await NFTService.getUserAgreement(HttpRunnerParams());
    }else{
      content = await NFTService.getPrivacyAgreement(HttpRunnerParams());
    }
  }
}