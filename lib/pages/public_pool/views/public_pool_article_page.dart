import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/pages/public_pool/controllers/public_pool_article_controller.dart';
import 'package:shiheyishu/entities/public_comment_list_entity.dart';

class PublicPoolArticlePage extends GetView<PublicPoolArticleController> {
  const PublicPoolArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicPoolArticleController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'public.pool.detail.title'.tr)
            .getAppBar(context),
        backgroundColor: AppColors.main,
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              return Stack(
                children: [CommonUtils.refreshFooter(mode), commentInput()],
              );
            },
          ),
          controller: controller.refreshController,
          onRefresh: controller.refreshList,
          onLoading: controller.loadMoreList,
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                switch (index) {
                  case 0:
                    return _body();
                  default:
                    return Container();
                }
              }, childCount: 1))
            ],
          ),
        ),
      );
    });
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.articleDetailEntity!.title}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 29),
                    child: Text(
                      '${controller.articleDetailEntity!.createTime}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  HtmlWidget(
                    controller.articleDetailEntity!.content!,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: WrapperImage(
                      url: controller.articleDetailEntity!.img,
                      width: Get.width - 50,
                      height: (Get.width - 50) / 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: AppColors.publicPoolDetailDivider,
            ),
            ListView.separated(
              padding: const EdgeInsets.only(bottom: 66),
              itemBuilder: (context, index) {
                Data comment = controller.comments[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                child: WrapperImage(
                                  url: comment.headImg,
                                  width: 32,
                                  height: 30,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  comment.nickName!,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            comment.createTime!.toString(),
                            style: const TextStyle(
                                color: AppColors.black9, fontSize: 12),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 42, top: 10),
                        child: Text(
                          comment.content!,
                          maxLines: 3,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  color: AppColors.publicPoolDivider,
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.comments.length,
            )
          ],
        ),
      ],
    );
  }

  Widget commentInput() {
    return Container(
      color: Colors.black,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: const BoxDecoration(
            color: AppColors.main,
            boxShadow: [
              BoxShadow(
                  color: AppColors.borderInsideColor,
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 1,
                  inset: true),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: controller.commentController,
                onSubmitted: (s) => controller.addArticleComment(),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration.collapsed(
                    hintText: 'public.pool.detail.comment.hint'.tr,
                    hintStyle: const TextStyle(
                        color: AppColors.publicPoolDetailCommentHint,
                        fontSize: 13)),
              ),
            ),
            InkWell(
              onTap: () => controller.addArticleComment(),
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.loginButtonLeftColor,
                        AppColors.loginButtonRightColor
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                'public.pool.detail.comment.send'.tr,
                style: const TextStyle(
                    color: AppColors.loginButtonTitleColor, fontSize: 13),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
