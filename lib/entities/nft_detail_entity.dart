import 'dart:convert';
/// id : 7
/// goods_name : "虎仔之下半身"
/// goods_image : "http://oss.ytsz.vip/16527578438262.jpg"
/// price : "22.02"
/// series_id : 1
/// author_image : "http://oss.ytsz.vip/16527578732466.png"
/// author_name : "1"
/// start_time : "2022-05-25 13:30:00"
/// limit_num : 100
/// show_minutes : 899998
/// issuer : "1"
/// purchase_info : "1"
/// create_time : "2022-05-17 11:25:52"
/// update_time : "2022-05-24 09:30:59"
/// is_nft : 0
/// token_uri : ""
/// total_num : 2022
/// author_info : "1"
/// issuer_image : "http://oss.ytsz.vip/16527578807268.png"
/// issuer_info : "1"
/// equity_type : 1
/// standard : "erc721"
/// sale : 0
/// status : 1
/// three_d : "https://oss.ytsz.vip/16527578632844.gltf"
/// info : "1"
/// share_img : "http://oss.ytsz.vip/16527579495423.jpg"
/// advance_goods_id : 0
/// advance_num : 0
/// series_name : "冰墩墩系列"
/// equity_type_desc : "衍生品"
/// status_desc : "未开始"

NftDetailEntity nftDetailEntityFromJson(String str) => NftDetailEntity.fromJson(json.decode(str));
String nftDetailEntityToJson(NftDetailEntity data) => json.encode(data.toJson());
class NftDetailEntity {
  NftDetailEntity({
      int? id, 
      String? goodsName, 
      String? goodsImage, 
      String? price, 
      int? seriesId, 
      String? authorImage, 
      String? authorName, 
      String? startTime, 
      int? limitNum, 
      int? showMinutes, 
      String? issuer, 
      String? purchaseInfo, 
      String? createTime, 
      String? updateTime, 
      int? isNft, 
      String? tokenUri, 
      int? totalNum, 
      String? authorInfo, 
      String? issuerImage, 
      String? issuerInfo, 
      int? equityType, 
      String? standard, 
      int? sale, 
      int? status, 
      String? threeD, 
      String? info, 
      String? shareImg, 
      int? advanceGoodsId, 
      int? advanceNum, 
      String? seriesName, 
      String? equityTypeDesc, 
      String? statusDesc,}){
    _id = id;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
    _price = price;
    _seriesId = seriesId;
    _authorImage = authorImage;
    _authorName = authorName;
    _startTime = startTime;
    _limitNum = limitNum;
    _showMinutes = showMinutes;
    _issuer = issuer;
    _purchaseInfo = purchaseInfo;
    _createTime = createTime;
    _updateTime = updateTime;
    _isNft = isNft;
    _tokenUri = tokenUri;
    _totalNum = totalNum;
    _authorInfo = authorInfo;
    _issuerImage = issuerImage;
    _issuerInfo = issuerInfo;
    _equityType = equityType;
    _standard = standard;
    _sale = sale;
    _status = status;
    _threeD = threeD;
    _info = info;
    _shareImg = shareImg;
    _advanceGoodsId = advanceGoodsId;
    _advanceNum = advanceNum;
    _seriesName = seriesName;
    _equityTypeDesc = equityTypeDesc;
    _statusDesc = statusDesc;
}

  NftDetailEntity.fromJson(dynamic json) {
    _id = json['id'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
    _price = json['price'];
    _seriesId = json['series_id'];
    _authorImage = json['author_image'];
    _authorName = json['author_name'];
    _startTime = json['start_time'];
    _limitNum = json['limit_num'];
    _showMinutes = json['show_minutes'];
    _issuer = json['issuer'];
    _purchaseInfo = json['purchase_info'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _isNft = json['is_nft'];
    _tokenUri = json['token_uri'];
    _totalNum = json['total_num'];
    _authorInfo = json['author_info'];
    _issuerImage = json['issuer_image'];
    _issuerInfo = json['issuer_info'];
    _equityType = json['equity_type'];
    _standard = json['standard'];
    _sale = json['sale'];
    _status = json['status'];
    _threeD = json['three_d'];
    _info = json['info'];
    _shareImg = json['share_img'];
    _advanceGoodsId = json['advance_goods_id'];
    _advanceNum = json['advance_num'];
    _seriesName = json['series_name'];
    _equityTypeDesc = json['equity_type_desc'];
    _statusDesc = json['status_desc'];
  }
  int? _id;
  String? _goodsName;
  String? _goodsImage;
  String? _price;
  int? _seriesId;
  String? _authorImage;
  String? _authorName;
  String? _startTime;
  int? _limitNum;
  int? _showMinutes;
  String? _issuer;
  String? _purchaseInfo;
  String? _createTime;
  String? _updateTime;
  int? _isNft;
  String? _tokenUri;
  int? _totalNum;
  String? _authorInfo;
  String? _issuerImage;
  String? _issuerInfo;
  int? _equityType;
  String? _standard;
  int? _sale;
  int? _status;
  String? _threeD;
  String? _info;
  String? _shareImg;
  int? _advanceGoodsId;
  int? _advanceNum;
  String? _seriesName;
  String? _equityTypeDesc;
  String? _statusDesc;
NftDetailEntity copyWith({  int? id,
  String? goodsName,
  String? goodsImage,
  String? price,
  int? seriesId,
  String? authorImage,
  String? authorName,
  String? startTime,
  int? limitNum,
  int? showMinutes,
  String? issuer,
  String? purchaseInfo,
  String? createTime,
  String? updateTime,
  int? isNft,
  String? tokenUri,
  int? totalNum,
  String? authorInfo,
  String? issuerImage,
  String? issuerInfo,
  int? equityType,
  String? standard,
  int? sale,
  int? status,
  String? threeD,
  String? info,
  String? shareImg,
  int? advanceGoodsId,
  int? advanceNum,
  String? seriesName,
  String? equityTypeDesc,
  String? statusDesc,
}) => NftDetailEntity(  id: id ?? _id,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
  price: price ?? _price,
  seriesId: seriesId ?? _seriesId,
  authorImage: authorImage ?? _authorImage,
  authorName: authorName ?? _authorName,
  startTime: startTime ?? _startTime,
  limitNum: limitNum ?? _limitNum,
  showMinutes: showMinutes ?? _showMinutes,
  issuer: issuer ?? _issuer,
  purchaseInfo: purchaseInfo ?? _purchaseInfo,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  isNft: isNft ?? _isNft,
  tokenUri: tokenUri ?? _tokenUri,
  totalNum: totalNum ?? _totalNum,
  authorInfo: authorInfo ?? _authorInfo,
  issuerImage: issuerImage ?? _issuerImage,
  issuerInfo: issuerInfo ?? _issuerInfo,
  equityType: equityType ?? _equityType,
  standard: standard ?? _standard,
  sale: sale ?? _sale,
  status: status ?? _status,
  threeD: threeD ?? _threeD,
  info: info ?? _info,
  shareImg: shareImg ?? _shareImg,
  advanceGoodsId: advanceGoodsId ?? _advanceGoodsId,
  advanceNum: advanceNum ?? _advanceNum,
  seriesName: seriesName ?? _seriesName,
  equityTypeDesc: equityTypeDesc ?? _equityTypeDesc,
  statusDesc: statusDesc ?? _statusDesc,
);
  int? get id => _id;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get price => _price;
  int? get seriesId => _seriesId;
  String? get authorImage => _authorImage;
  String? get authorName => _authorName;
  String? get startTime => _startTime;
  int? get limitNum => _limitNum;
  int? get showMinutes => _showMinutes;
  String? get issuer => _issuer;
  String? get purchaseInfo => _purchaseInfo;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  int? get isNft => _isNft;
  String? get tokenUri => _tokenUri;
  int? get totalNum => _totalNum;
  String? get authorInfo => _authorInfo;
  String? get issuerImage => _issuerImage;
  String? get issuerInfo => _issuerInfo;
  int? get equityType => _equityType;
  String? get standard => _standard;
  int? get sale => _sale;
  int? get status => _status;
  String? get threeD => _threeD;
  String? get info => _info;
  String? get shareImg => _shareImg;
  int? get advanceGoodsId => _advanceGoodsId;
  int? get advanceNum => _advanceNum;
  String? get seriesName => _seriesName;
  String? get equityTypeDesc => _equityTypeDesc;
  String? get statusDesc => _statusDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    map['price'] = _price;
    map['series_id'] = _seriesId;
    map['author_image'] = _authorImage;
    map['author_name'] = _authorName;
    map['start_time'] = _startTime;
    map['limit_num'] = _limitNum;
    map['show_minutes'] = _showMinutes;
    map['issuer'] = _issuer;
    map['purchase_info'] = _purchaseInfo;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['is_nft'] = _isNft;
    map['token_uri'] = _tokenUri;
    map['total_num'] = _totalNum;
    map['author_info'] = _authorInfo;
    map['issuer_image'] = _issuerImage;
    map['issuer_info'] = _issuerInfo;
    map['equity_type'] = _equityType;
    map['standard'] = _standard;
    map['sale'] = _sale;
    map['status'] = _status;
    map['three_d'] = _threeD;
    map['info'] = _info;
    map['share_img'] = _shareImg;
    map['advance_goods_id'] = _advanceGoodsId;
    map['advance_num'] = _advanceNum;
    map['series_name'] = _seriesName;
    map['equity_type_desc'] = _equityTypeDesc;
    map['status_desc'] = _statusDesc;
    return map;
  }

}