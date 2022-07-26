import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/pages/public_pool/controllers/public_pool_controller.dart';
import 'package:shiheyishu/entities/public_article_list_entity.dart' as pa;
import 'package:shiheyishu/entities/public_pool_log_entity.dart';

class PublicPoolPage extends GetView<PublicPoolController> {
  const PublicPoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicPoolController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        backgroundColor: AppColors.main,
        body: _body(),
      );
    });
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        WrapperImage(
          url: 'public_top.png',
          width: Get.width,
          height: Get.width * 0.7,
          imageType: ImageType.assets,
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.width * 0.35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'public.pool.title'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Text(
                    controller.number!,
                    style: const TextStyle(
                        color: AppColors.codeButtonTitleColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: Get.width * 0.6),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, AppColors.publicPoolBack]),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => controller.tabClicked(0),
                      child: Column(
                        children: [
                          Text(
                            'public.pool.log'.tr,
                            style: TextStyle(
                                color: controller.tabIndex == 0
                                    ? AppColors.codeButtonTitleColor
                                    : AppColors.nftUnselectColor,
                                fontSize: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            width: 45,
                            height: 2,
                            color: controller.tabIndex == 0
                                ? AppColors.codeButtonTitleColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.tabClicked(1),
                      child: Column(
                        children: [
                          Text(
                            'public.pool.article.list'.tr,
                            style: TextStyle(
                                color: controller.tabIndex == 1
                                    ? AppColors.codeButtonTitleColor
                                    : AppColors.nftUnselectColor,
                                fontSize: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            width: 45,
                            height: 2,
                            color: controller.tabIndex == 1
                                ? AppColors.codeButtonTitleColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    return CommonUtils.refreshFooter(mode);
                  },
                ),
                controller: controller.refreshController,
                onRefresh: controller.refreshList,
                onLoading: controller.loadMoreList,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (controller.tabIndex == 0) {
                      Data logInfo = controller.logs[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        logInfo.nickname!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          logInfo.createTime!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '+',
                                        style: TextStyle(
                                            color: AppColors.rankBackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        logInfo.num!,
                                        style: const TextStyle(
                                            color: AppColors.rankBackColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              color: AppColors.publicPoolDivider,
                              height: 2,
                            )
                          ],
                        ),
                      );
                    } else {
                      pa.Data article = controller.articles[index];
                      return InkWell(
                        onTap: () => controller.pushPublicArticleDetail(index),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                child: WrapperImage(
                                  url: article.img,
                                  width: Get.width - 30,
                                  height: (Get.width - 30) / 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        article.title!,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: AppColors.black3,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Text(
                                      article.content!,
                                      maxLines: 2,
                                      style: const TextStyle(
                                      color: AppColors.black9,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  itemCount: controller.tabIndex == 0
                      ? controller.logs.length
                      : controller.articles.length,
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
