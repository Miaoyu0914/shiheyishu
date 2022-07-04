import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/blind_box_detail_entity.dart';
import 'package:shiheyishu/entities/market_detail_entity.dart';
import 'package:shiheyishu/entities/nft_detail_entity.dart';

class PayController extends ViewStateController {
  int payType;
  var orderSn;
  var entity;
  PayController({required this.orderSn, required this.payType, required this.entity});
  NftDetailEntity? nftDetailEntity;
  BlindBoxDetailEntity? blindBoxDetailEntity;
  MarketDetailEntity? marketDetailEntity;

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
    switch(payType){
      case 0:
        nftDetailEntity = entity;
        break;
      case 1:
        blindBoxDetailEntity = entity;
        break;
      case 2:
        marketDetailEntity = entity;
        break;
      default:
        break;
    }
  }

  void changePayKind(int index) {
    payKind = index;
    update();
  }

}