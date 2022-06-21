import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/logger/logger_utils.dart';
import 'package:shiheyishu/locales/local.dart';
import 'package:shiheyishu/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoading.instance.userInteractions;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: LocalService.locale,
      fallbackLocale: LocalService.fallbackLocale,
      translations: LocalService(),
      builder: (context,child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: GestureDetector(
            child: FlutterEasyLoading(child: child),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
          ),
        );
      },
    );
  }
}