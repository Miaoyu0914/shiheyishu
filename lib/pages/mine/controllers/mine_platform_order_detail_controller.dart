import 'package:get/get.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/entities/mine_platform_order_entity.dart';

class MinePlatformOrderDetailController extends ViewStateController {
  Data data;
  MinePlatformOrderDetailController({required this.data});
  @override
  void onInit() {
    super.onInit();

  }

  String getOrderTitleString(){
    switch(data.status){
      case -1:
        return 'order.detail.status.cancel'.tr;
      case 0:
        return 'order.detail.status.future'.tr;
      case 1:
        return 'order.detail.status.finish'.tr;
      default:
        return '';
    }
  }

  String getOrderStatusString(){
    switch(data.status){
      case -1:
        return 'order.detail.cancel'.tr;
      case 0:
        return 'order.detail.future'.tr;
      case 1:
        return 'order.detail.finish'.tr;
      default:
        return '';
    }
  }

  String getOrderStatusImg(){
    switch(data.status){
      case -1:
        return 'yiquxiao.png';
      case 0:
        return 'daifukuan.png';
      case 1:
        return 'yiwancheng.png';
      default:
        return '';
    }
  }

  void gotoPay() {
    Get.toNamed(Routes.NAV+Routes.PAY, arguments: {
      'orderSn': data.orderSn,
      'payType': 3,
      'entity': data
    });
  }

}