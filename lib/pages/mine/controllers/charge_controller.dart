import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class ChargeController extends ViewStateController {
  TextEditingController priceController = TextEditingController();
  int selectIndex = 0;
  int payKind = 0;

  @override
  void onInit() {
    super.onInit();

  }

  void changeIndex(int index) {
    selectIndex = index;
    if(index > 0){
      priceController.text = '';
    }
    update();
  }

  void charge() {
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
                child: Text('charge.mode'.tr, style: const TextStyle(color: Colors.white, fontSize: 14),),
              ),
              InkWell(
                onTap: (){
                  setState((){
                    payKind = 0;
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
                              'charge.card'.tr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      WrapperImage(
                        url: payKind == 0
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
                    payKind = 1;
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
                              'charge.ali'.tr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      WrapperImage(
                        url: payKind == 1
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
                onTap: () => createOrder(),
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
                    'charge.sure'.tr,
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

  Future<void> createOrder() async {
    Get.back();
    EasyLoading.show();
    if(getAmount() == ''){
      EasyLoading.showToast('charge.sure.hint'.tr);
    }else{
      String? order = await NFTService.getChargeOrder(HttpRunnerParams(
          data: {
            'amount': getAmount(),
            'pay_type': '5'
          }
      ));
      if(order != ''){
        String? url = await NFTService.getPayUrl(HttpRunnerParams(
            data: {
              'order_sn': order,
              'app': 1
            }
        ));
        EasyLoading.dismiss();
        if(url != ''){
          Get.toNamed(Routes.NAV+Routes.WALLET+Routes.CHARGE+Routes.PAYWEBVIEW, arguments: {'url': url});
        }
      }else{
        EasyLoading.dismiss();
      }
    }
  }

  String getAmount() {
    if(selectIndex != 0){
      switch(selectIndex){
        case 1:
          return '100';
        case 2:
          return '500';
        case 3:
          return '1000';
        default:
          return '';
      }
    }else{
      return priceController.text;
    }
  }

}