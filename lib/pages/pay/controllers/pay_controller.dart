import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/entities/market_detail_entity.dart';
import 'package:shiheyishu/entities/nft_detail_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';
import 'package:shiheyishu/entities/mine_platform_order_entity.dart' as mpo;

class PayController extends ViewStateController {
  int payType;
  var orderSn;
  var entity;

  PayController(
      {required this.orderSn, required this.payType, required this.entity});

  NftDetailEntity? nftDetailEntity;
  BlindBoxDetailEntity? blindBoxDetailEntity;
  MarketDetailEntity? marketDetailEntity;
  mpo.Data? mpoData;


  String countDownTitle = '';
  int payKind = 0;

  @override
  void onInit() {
    super.onInit();
    setBusy();
    initEntity();
    setIdle();
  }

  void initEntity() {
    switch (payType) {
      case 0:
        nftDetailEntity = entity;
        break;
      case 1:
        blindBoxDetailEntity = entity;
        break;
      case 2:
        marketDetailEntity = entity;
        break;
      case 3:
        mpoData = entity;
        break;
      default:
        break;
    }
  }

  void changePayKind(int index) {
    payKind = index;
    update();
  }

  TextEditingController payPSWController = TextEditingController();
  String psw = '';

  void pay(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black9),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.codeButtonTitleColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
      ),
    );

    showDialog(
      context: context,
      builder: (ctx) {
        return WillPopScope(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              margin: EdgeInsets.only(left: 30, right: 30,top: Get.height / 3, bottom: Get.height / 3),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      'please.input.psw'.tr,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    length: 6,
                    controller: payPSWController,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 20,left: 50,right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Get.back(),
                            child: Text(
                              'please.input.psw.cancel'.tr,
                              style: const TextStyle(
                                  color: AppColors.black3,
                                  fontSize: 16),
                            )),
                        InkWell(
                            onTap: () => payMoney(),
                            child: Text(
                              'please.input.psw.sure'.tr,
                              style: const TextStyle(
                                  color: AppColors.codeButtonTitleColor,
                                  fontSize: 16),
                            ))
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

  void cancel() {}

  void payMoney() {
    Get.back();
    switch(payType){
      case 0:
        payNFTOrder();
        break;
      case 1:
        payBlindBoxOrder();
        break;
      case 2:
        payMarketOrder();
        break;
    }
  }

  Future<void> payNFTOrder() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.payNFTOrder(
      HttpRunnerParams(
        data: {
          'order_sn': orderSn,
          'pay_type': 3,
          'password': payPSWController.text
        }
      )
    );
    EasyLoading.dismiss();
    if(isSuccess!){
      Get.back();
      EasyLoading.showSuccess('pay.success'.tr);
    }
  }

  Future<void> payBlindBoxOrder() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.payBlindBoxOrder(
        HttpRunnerParams(
            data: {
              'order_sn': orderSn,
              'pay_type': 3,
              'password': payPSWController.text
            }
        )
    );
    EasyLoading.dismiss();
    if(isSuccess!){
      Get.back();
      EasyLoading.showSuccess('pay.success'.tr);
    }
  }

  Future<void> payMarketOrder() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.payMarketOrder(
        HttpRunnerParams(
            data: {
              'order_sn': orderSn,
              'pay_type': 3,
              'password': payPSWController.text
            }
        )
    );
    EasyLoading.dismiss();
    if(isSuccess!){
      Get.back();
      EasyLoading.showSuccess('pay.success'.tr);
    }
  }

  Future<bool> pop() async {
    return true;
  }
}
