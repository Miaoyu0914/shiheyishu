import 'package:shiheyishu/configs/state/view_state_controller.dart';

class MineBlindBoxDetailController extends ViewStateController {
  var id;
  bool isOpen = false;
  MineBlindBoxDetailController({required this.id, required this.isOpen});

  @override
  void onInit() {
    super.onInit();

  }

}