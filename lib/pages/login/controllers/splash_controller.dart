import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';

class SplashController extends ViewStateController {
  int countNumber = 3;
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startCount();
  }

  void startCount() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(countNumber <= 0){
        _timer?.cancel();
      }else{
        countNumber -= 1;
        update();
      }
    });
  }

  void endCount() {
    print(countNumber);
    countNumber = 0;

    update();
  }

  void pushToNextPage() {
    // SharedPreferences sharedPreferences
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}