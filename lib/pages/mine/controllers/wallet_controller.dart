import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/entities/wallet_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class WalletController extends ViewStateController {
  WalletListEntity? walletListEntity;
  UserInfoEntity? userInfoEntity;
  List<Data> wallets = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getUserInfo();
    await getWalletList();
  }

  Future<void> getUserInfo() async {
    userInfoEntity = await NFTService.getUserInfo(HttpRunnerParams());
  }

  Future<void> getWalletList() async {
    wallets.clear();
    walletListEntity = await NFTService.getWalletList(HttpRunnerParams(data: {
      "page":1,
    }));
    wallets.addAll(walletListEntity!.data!);
    if(wallets.isNotEmpty){
      setIdle();
    }else{
      setEmpty();
    }
  }

  void pushToWalletListPage() {
    Get.toNamed(Routes.NAV+Routes.WALLET+Routes.WALLETLIST);
  }

  void pushToChargePage() {
    Get.toNamed(Routes.NAV+Routes.WALLET+Routes.CHARGE);
  }

  void pushToCashOutPage() {
    Get.toNamed(Routes.NAV+Routes.WALLET+Routes.CASHOUT);
  }

}