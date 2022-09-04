import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/mine/controllers/pay_web_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebViewPage extends GetView<PayWebViewController> {
  const PayWebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayWebViewController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () => controller.getBack(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 18, left: 18, right: 18),
              child: WrapperImage(
                url: 'nav_back.png',
                imageType: ImageType.assets,
                fit: BoxFit.contain,
              ),
            ),
          ),
          backgroundColor: AppColors.main,
          title: Text(
            'charge.title'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        backgroundColor: AppColors.main,
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              switch (index) {
                case 0:
                  return _body();
                default:
                  return Container();
              }
            }, childCount: 1))
          ],
        ),
      );
    });
  }

  Widget _body() {
    return HtmlWidget(
      controller.url,
    );
  }
}