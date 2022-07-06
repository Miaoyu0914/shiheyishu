import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/sell_free_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class RESellController extends ViewStateController {
  var id;
  var image;
  var name;
  var hash;
  RESellController({required this.id, required this.image, required this.name, required this.hash});
  SellFreeEntity? sellFreeEntity;
  TextEditingController priceController = TextEditingController();
  double payFree = 0.00;
  double serviceFree = 0.00;
  double shareFree = 0.00;
  double getMoney = 0.00;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getSellFree();
    setIdle();
    priceController.addListener(() {
      double price = double.parse(priceController.text);
      payFree = price * double.parse(sellFreeEntity!.payFee!) / 100;
      serviceFree = price * double.parse(sellFreeEntity!.serviceFee!) / 100;
      shareFree = price * double.parse(sellFreeEntity!.copyrightFee!) / 100;
      getMoney = price - payFree - serviceFree - shareFree;
      update();
    });
  }

  Future<void> getSellFree() async {
    sellFreeEntity = await NFTService.getSellFree(HttpRunnerParams());
  }

  Future<void> sellToAnother() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.sellToAnother(HttpRunnerParams(
        data: {
          'id': id,
          'price': priceController.text
        }
    ));
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showSuccess('mine.nft.detail.sell.success'.tr);
      Get.back();
    }
  }

}