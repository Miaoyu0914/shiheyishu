import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/home/views/home_page.dart';
import 'package:shiheyishu/pages/market/views/market_page.dart';
import 'package:shiheyishu/pages/mine/views/mine_page.dart';
import 'package:shiheyishu/pages/nav/controllers/nav_bar_controller.dart';

import '../../blind_box/views/blind_box_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  final controller = Get.find<NavBarController>();

  @override
  Widget build(BuildContext context) {
    if (controller.isBusy) {
      return ViewStateBusyWidget();
    }
    return GetBuilder<NavBarController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IndexedStack(
                children: const <Widget>[
                  HomePage(),
                  BlindBoxPage(),
                  MarketPage(),
                  MinePage(),
                ],
                index: controller.currentIndex,
              ),
              Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 36),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.navTitles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.changeNavBarIndex(index);
                      },
                      child: Container(
                        color: Colors.transparent,
                        width: (Get.width - 30) / controller.navTitles.length,
                        child: Column(
                          children: [
                            WrapperImage(
                              url: controller.currentIndex == index
                                  ? controller.navSelectedIcons[index]
                                  : controller.navNormalIcons[index],
                              width: 20,
                              height: 20,
                              imageType: ImageType.assets,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                controller.navTitles[index],
                                style: TextStyle(
                                    color: controller.currentIndex == index
                                        ? AppColors.navSelectedTitleColor
                                        : Colors.white,
                                    fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ));
    });
  }
}
