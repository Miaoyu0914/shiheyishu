import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/constant.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/public_article_detail_entity.dart';
import 'package:shiheyishu/entities/public_comment_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class PublicPoolArticleController extends ViewStateController {
  var id;

  PublicPoolArticleController({required this.id});

  PublicArticleDetailEntity? articleDetailEntity;
  PublicCommentListEntity? publicCommentListEntity;
  List<Data> comments = [];
  int page = 1;
  bool isNotEnough = false;
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  TextEditingController commentController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    await getArticleDetail();
    await getCommentList();
    setIdle();
  }

  Future<void> getArticleDetail() async {
    articleDetailEntity = await NFTService.getPublicArticleDetail(
        HttpRunnerParams(data: {'id': id}));
  }

  Future<void> getCommentList() async {
    publicCommentListEntity = await NFTService.getPublicCommentList(
        HttpRunnerParams(data: {'news_id': id, 'page': page}));
    comments.addAll(publicCommentListEntity!.data!);
    if (publicCommentListEntity!.data!.length < Constant.refreshListLimit) {
      isNotEnough = true;
    }
  }

  void refreshList() async {
    comments.clear();
    page = 1;
    isNotEnough = false;
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.idle);
    await getCommentList();
    refreshController.refreshCompleted();
    if (isNotEnough) {
      refreshController.loadNoData();
    }
  }

  void loadMoreList() async {
    page++;
    await getCommentList();
    if (isNotEnough) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  Future<void> addArticleComment() async {
    EasyLoading.show();
    bool? isSuccess = await NFTService.addPublicComment(
      HttpRunnerParams(
        data: {
          'content': commentController.text,
          'news_id': id
        }
      )
    );
    commentController.text = '';
    EasyLoading.dismiss();
    if(isSuccess!){
      EasyLoading.showSuccess('public.pool.detail.comment.success'.tr);
    }
  }
}
