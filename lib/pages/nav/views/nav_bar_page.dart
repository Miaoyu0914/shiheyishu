import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
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

class _NavBarPageState extends State<NavBarPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<NavBarController>();
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    tabController?.addListener(() {
      controller.changeNavBarIndex(tabController!.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isBusy) {
      return ViewStateBusyWidget();
    }
    return GetBuilder<NavBarController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.main,
        body: TabBarView(
          controller: tabController,
          children: const [
            HomePage(),
            BlindBoxPage(),
            MarketPage(),
            MinePage()
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 36),
          child: TabBar(
            controller: tabController,
            enableFeedback: false,
            splashBorderRadius: const BorderRadius.all(Radius.circular(35)),
            indicator: const BoxDecoration(),
            tabs: [
              Tab(
                child: Column(
                  children: [
                    Text(controller.clickedIndex == 0 ? '000' : '111')
                  ],
                ),
              ),
              Tab(
                text: 'blind.box.title'.tr,
                icon: Icon(Icons.home),

              ),
              Tab(
                text: 'market.title'.tr,
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'mine.title'.tr,
                icon: Icon(Icons.home),
              )
            ],
          ),
        ),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverList(
        //         delegate: SliverChildBuilderDelegate((context, index) {
        //           switch (index) {
        //             case 0:
        //               return _body();
        //             default:
        //               return Container();
        //           }
        //         }, childCount: 1))
        //   ],
        // ),
      );
    });
  }
}
