import 'package:flutter/cupertino.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';

class MarketController extends ViewStateController {
  TextEditingController? searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }


}