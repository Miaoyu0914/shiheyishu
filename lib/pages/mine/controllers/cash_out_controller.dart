import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/cash_out_info_entity.dart';
import 'package:shiheyishu/entities/user_info_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class CashOutController extends ViewStateController {
  UserInfoEntity? userInfoEntity;
  CashOutInfoEntity? cashOutInfoEntity;
  TextEditingController priceController = TextEditingController();
  int payType = 0;
  String amount = '0';

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getUserInfo();
    await getCashOutInfo();
  }

  Future<void> getUserInfo() async {
    userInfoEntity = await NFTService.getUserInfo(HttpRunnerParams());
  }

  Future<void> getCashOutInfo() async {
    cashOutInfoEntity = await NFTService.getCashOutInfo(HttpRunnerParams());
    setIdle();
  }

  void allOut() {
    priceController.text = cashOutInfoEntity!.balance!;
    onTextFieldChanged(cashOutInfoEntity!.balance!);
    update();
  }

  void onTextFieldChanged(String value){
    amount = (double.parse(value) - double.parse(cashOutInfoEntity!.fee!)).toStringAsFixed(2);
    update();
  }

  void changePayType() {
    Get.bottomSheet(
        StatefulBuilder(builder: (context, setState){
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                color: AppColors.main
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 6,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      color: AppColors.navSelectedTitleColor,
                      borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text('cash.out.mode'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      payType = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppColors.payKindBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.borderInsideColor,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 1,
                              inset: true),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            WrapperImage(
                              url: 'balance.png',
                              width: 17,
                              height: 17,
                              imageType: ImageType.assets,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'cash.out.card'.tr,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        WrapperImage(
                          url: payType == 0
                              ? 'selected.png'
                              : 'unselected.png',
                          width: 14,
                          height: 14,
                          imageType: ImageType.assets,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState((){
                      payType = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppColors.payKindBackColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.borderInsideColor,
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 1,
                              inset: true),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            WrapperImage(
                              url: 'zhifubao.png',
                              width: 17,
                              height: 17,
                              imageType: ImageType.assets,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'cash.out.ali'.tr,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        WrapperImage(
                          url: payType == 1
                              ? 'selected.png'
                              : 'unselected.png',
                          width: 14,
                          height: 14,
                          imageType: ImageType.assets,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => selectSure(),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.loginButtonLeftColor,
                              AppColors.loginButtonRightColor
                            ])),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 16.5, bottom: 16.5),
                    margin: const EdgeInsets.only(top: 20, left: 54, right: 54, bottom: 50),
                    child: Text(
                      'cash.out.sure'.tr,
                      style: const TextStyle(
                          height: 1,
                          color: AppColors.loginButtonTitleColor,
                          fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          );
        })
    );
  }

  void selectSure() {
    update();
    Get.back();
  }

  Future<void> cashOut() async {
    if(priceController.text == '' && double.parse(priceController.text) < double.parse(cashOutInfoEntity!.min!)){
      EasyLoading.showToast('cash.out.must'.tr);
    }else{
      EasyLoading.show();
      bool? isSuccess = await NFTService.cashOut(HttpRunnerParams(
        data: {
          'amount': priceController.text,
          'name': payType == 0 ? userInfoEntity!.bankName : userInfoEntity!.aliName,
          'account': payType == 0 ? userInfoEntity!.bankAccount : userInfoEntity!.aliAccount,
          'pay_type': payType == 0 ? '3' : '2',
          'bank': payType == 0 ? userInfoEntity!.bank : '',
        }
      ));
      EasyLoading.dismiss();
      if(isSuccess!){
        EasyLoading.showSuccess('cash.out.success'.tr);
        Get.back();
      }
    }
  }
}