import 'dart:convert';

import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/slider_verify_entity.dart';

class VerifyController extends ViewStateController {
  @override
  void onInit() {
    super.onInit();

  }

  void getMessageFromJS(String message) {
    SliderVerifyEntity sliderVerifyEntity = SliderVerifyEntity.fromJson(json.decode(message));

  }

}