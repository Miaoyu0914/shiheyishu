import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/pages/market/controllers/market_controller.dart';

class MarketPage extends GetView<MarketController> {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('market.title'.tr)
    );
  }
}