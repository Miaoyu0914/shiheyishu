import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/market/controllers/market_controller.dart';

class MarketPage extends GetView<MarketController> {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
          backgroundColor: AppColors.main,
          appBar: AppBar(
            title: Center(
                child: Text(
              'market.title'.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            leadingWidth: 0,
            leading: Container(),
            backgroundColor: AppColors.main,
            elevation: 0,
          ),
          body: Column(
            children: [_searchBar(), _screenBar(), _marketNFTList()],
          ));
    });
  }

  Widget _marketNFTList() {
    return Container();
  }

  Widget _screenBar() {
    return Row();
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: AppColors.borderInsideColor,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 1,
              inset: true),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: WrapperImage(
              url: 'search.png',
              width: 17,
              height: 17,
              imageType: ImageType.assets,
            ),
          ),
          Expanded(
            child: TextField(
              onEditingComplete: () => controller.search(),
              controller: controller.searchController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration.collapsed(
                  hintText: 'market.search.hint'.tr,
                  hintStyle: const TextStyle(
                      color: AppColors.nftUnselectColor, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
