import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/market_detail_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MarketDetailController extends ViewStateController {
  var id;

  MarketDetailController({required this.id});

  MarketDetailEntity? marketDetailEntity;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getMarketDetail();
    setIdle();
  }

  Future<void> getMarketDetail() async {
    marketDetailEntity =
        await NFTService.getMarketDetail(HttpRunnerParams(data: {'id': id}));
  }

  void pushToSeriesPage() {
    Get.toNamed(Routes.NAV + Routes.SERIES,
        arguments: {'id': marketDetailEntity!.seriesId});
  }

  Future<void> pushToPayPage() async {
    EasyLoading.show();
    String? orderSn = await NFTService.createMarketOrder(
        HttpRunnerParams(
            data: {
              'goods_id': marketDetailEntity!.id
            }
        )
    );
    EasyLoading.dismiss();
    if(orderSn != ''){
      Get.toNamed(Routes.NAV+Routes.PAY, arguments: {
        'orderSn': orderSn,
        'payType': 0,
        'entity': marketDetailEntity
      });
    }
  }
}
