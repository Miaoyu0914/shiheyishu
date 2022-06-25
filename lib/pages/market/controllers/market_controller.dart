import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shiheyishu/configs/state/view_state_controller.dart';
import 'package:shiheyishu/entities/market_nft_list_entity.dart';
import 'package:shiheyishu/services/http/http_runner_params.dart';
import 'package:shiheyishu/services/nft_service.dart';

class MarketController extends ViewStateController {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  TextEditingController? searchController;
  MarketNftListEntity? marketNftListEntity;
  bool isPriceTop = false;
  bool isNewTop = false;
  int page = 1;
  String seriesID = "";

  @override
  Future<void> onInit() async {
    super.onInit();
    setBusy();
    searchController = TextEditingController(text: "");
    await getMarketNFTList(true);
    setIdle();
  }

  Future<void> getMarketNFTList(bool isPrice) async {
    marketNftListEntity = await NFTService.getMarketNFTs(HttpRunnerParams(
      data: {
        "page": page,
        "series_id": seriesID,
        "field": isPrice ? "price" : "create_time",
        "sort": isPrice ? isPriceTop ? "asc" : "desc" : isNewTop ? "asc" : "desc",
        "keywords": searchController?.text
       }
    ));
  }

  void refreshList() async {}

  void loadMoreList() async {}

  void priceScreenClicked() {
    isPriceTop = !isPriceTop;
  }

  void search() {
    print("search");
  }
}