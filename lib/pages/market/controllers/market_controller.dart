import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/AppColors.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/configs/widgets/image.dart';
import 'package:shiheyishu/entities/home_album_entity.dart';
import 'package:shiheyishu/entities/market_nft_list_entity.dart';
import 'package:shiheyishu/routes/app_pages.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MarketController extends ViewStateController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController? searchController;
  MarketNftListEntity? marketNftListEntity;
  List<Data> marketNFTs = [];
  List<HomeAlbumEntity>? albums;
  int priceValue = 0;
  int newValue = 0;
  int page = 1;
  String seriesID = "";
  int albumSelectIndex = -1;

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    searchController = TextEditingController(text: "");
    await getAlbumList();
    await getMarketNFTList();
    setIdle();
  }

  Future<void> getAlbumList() async {
    albums = await NFTService.getAlbums(HttpRunnerParams());
  }

  Future<void> getMarketNFTList() async {
    marketNftListEntity =
        await NFTService.getMarketNFTs(HttpRunnerParams(data: {
      "page": page,
      "series_id": seriesID,
      "field": (priceValue == 0 && newValue == 0)
          ? ""
          : newValue == 0
              ? "price"
              : "create_time",
      "sort": (priceValue == 0 && newValue == 0)
          ? ""
          : newValue == 0
              ? priceValue == 1
                  ? "asc"
                  : "desc"
              : newValue == 1
                  ? "asc"
                  : "desc",
      "keywords": searchController?.text
    }));
    if (marketNftListEntity!.data!.isEmpty) {
      page--;
    }
    marketNFTs.addAll(marketNftListEntity!.data!);
  }

  void refreshList() async {
    page = 1;
    marketNFTs.clear();
    await getMarketNFTList();
    update();
    refreshController.refreshCompleted();
  }

  void loadMoreList() async {
    page++;
    await getMarketNFTList();
    update();
    refreshController.loadComplete();
  }

  Future<void> priceScreenClicked() async {
    EasyLoading.show();
    newValue = 0;
    page = 1;
    marketNFTs.clear();
    if (priceValue < 2) {
      priceValue++;
    } else {
      priceValue = 0;
    }
    await getMarketNFTList();
    update();
    EasyLoading.dismiss();
  }

  Future<void> newScreenClicked() async {
    EasyLoading.show();
    priceValue = 0;
    page = 1;
    marketNFTs.clear();
    if (newValue < 2) {
      newValue++;
    } else {
      newValue = 0;
    }
    await getMarketNFTList();
    update();
    EasyLoading.dismiss();
  }

  Future<void> search() async {
    EasyLoading.show();
    page = 1;
    priceValue = 0;
    newValue = 0;
    marketNFTs.clear();
    await getMarketNFTList();
    update();
    EasyLoading.dismiss();
  }

  void pushToMarketDetailPage(int index) {
    Get.toNamed(Routes.NAV + Routes.MARKETDETAIL,
        arguments: {'id': marketNFTs[index].id});
  }

  void showAlbumSelectSheet(BuildContext context) {
    if(albums!.isNotEmpty){
      showDialog(
        context: context,
        builder: (ctx) {
          return WillPopScope(
            child: Padding(
              padding: EdgeInsets.only(top: Get.statusBarHeight
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 150,
                    height: 180,
                    padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.marketSelectColor
                    ),
                    child: ListView.builder(itemBuilder: (lContext, index){
                      return InkWell(
                        onTap: () => albumSelected(index),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(albums![index].seriesName!, style: const TextStyle(color: Colors.white, fontSize: 14),),
                              Offstage(
                                offstage: albumSelectIndex != index,
                                child: WrapperImage(url: 'market_checked.png', width: 12, height: 12,imageType: ImageType.assets,),
                              )
                            ],
                          ),
                        ),
                      );
                    }, itemCount: albums!.length,),
                  )
                ],
              ),
            ),
            onWillPop: () async => pop(),
          );
        },
      );
    }
  }

  Future<void> albumSelected(int index) async {
    Get.back();
    if(albumSelectIndex == index){
      albumSelectIndex = -1;
      seriesID = "";
    }else{
      albumSelectIndex = index;
      seriesID = albums![index].id.toString();
    }
    EasyLoading.show();
    page = 1;
    priceValue = 0;
    newValue = 0;
    marketNFTs.clear();
    await getMarketNFTList();
    update();
    EasyLoading.dismiss();
  }

  Future<bool> pop() async {
    return true;
  }
}
