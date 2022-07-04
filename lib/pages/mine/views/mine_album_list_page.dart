import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/common.dart';
import 'package:shiheyishu/configs/state/view_state_widget.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/configs/widgets/normal_appbar.dart';
import 'package:shiheyishu/entities/mine_album_list_entity.dart';
import 'package:shiheyishu/pages/mine/controllers/mine_album_list_controller.dart';

class MineAlbumListPage extends GetView<MineAlbumListController> {
  const MineAlbumListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineAlbumListController>(builder: (controller) {
      if (controller.isBusy) {
        return ViewStateBusyWidget();
      }
      return Scaffold(
        appBar: NormalAppBar(title: 'mine.album.title'.tr).getAppBar(context),
        backgroundColor: AppColors.main,
        body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context,LoadStatus? mode){
                    return CommonUtils.refreshFooter(mode);
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//横轴元素个数
          crossAxisCount: 2,
//纵轴间距
          mainAxisSpacing: 15.0,
//横轴间距
          crossAxisSpacing: 10.0,
//子组件宽高长度比例
          childAspectRatio: 0.79),
      itemBuilder: (context, index) {
        Data album = controller.albums[index];
        return Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(10)),child: WrapperImage(url: album.cover, width: (Get.width - 45) / 2, height: (Get.width - 45) / 2,)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(album.goodsName!, style: const TextStyle(color: Colors.white, fontSize: 14),),
                    Row(
                      children: [
                        WrapperImage(url: 'num_icon.png', width: 11, height: 11, imageType: ImageType.assets,),
                        Text(' '+album.goodsNumber.toString(), style: const TextStyle(color: AppColors.codeButtonTitleColor, fontSize: 13),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: controller.albums.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
    );
  }
}
