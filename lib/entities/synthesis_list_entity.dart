import 'dart:convert';
/// id : 2
/// goods_name : "合成2"
/// goods_image : "http://oos.ymhzf.com/16484484951606.jpg"
/// price : "88.00"
/// series_id : 3
/// author_image : "http://oos.ymhzf.com/16484485029168.png"
/// author_name : "创作者名称"
/// issuer : "发行方名称"
/// create_time : "2022-03-28 14:21:56"
/// update_time : "2022-03-28 14:21:56"
/// is_nft : 1
/// token_uri : "https://ipfs.infura.io/ipfs/QmUwQxFbxu5ggqZPGrs4TTrvKUbSGmCAk3aopbH3TMiWDx"
/// total_num : 0
/// author_info : "创作者简介"
/// issuer_image : "http://oos.ymhzf.com/16484485122545.png"
/// issuer_info : "发行方简介\r\n发行方简介"
/// equity_type : 1
/// standard : "ERC721"
/// three_d : "http://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj"
/// share_img : "http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png"
/// is_show : 1
/// detail : [{"id":3,"synthetic_goods_id":2,"goods_name":"雪容绒F1","num":1,"create_time":1648448525,"update_time":1648448525,"goods_image":"http://oos.ymhzf.com/16484471277594.jpeg"},{"id":4,"synthetic_goods_id":2,"goods_name":"盲盒冰1","num":1,"create_time":1648448535,"update_time":1648448535,"goods_image":"http://oos.ymhzf.com/16484479887450.jpeg"}]

SynthesisListEntity synthesisListEntityFromJson(String str) => SynthesisListEntity.fromJson(json.decode(str));
String synthesisListEntityToJson(SynthesisListEntity data) => json.encode(data.toJson());
class SynthesisListEntity {
  SynthesisListEntity({
      int? id, 
      String? goodsName, 
      String? goodsImage, 
      String? price, 
      int? seriesId, 
      String? authorImage, 
      String? authorName, 
      String? issuer, 
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
      String? threeD, 
      String? shareImg, 
      int? isShow, 
      List<Detail>? detail,}){
    _id = id;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
    _price = price;
    _seriesId = seriesId;
    _authorImage = authorImage;
    _authorName = authorName;
    _issuer = issuer;
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
    _threeD = threeD;
    _shareImg = shareImg;
    _isShow = isShow;
    _detail = detail;
}

  SynthesisListEntity.fromJson(dynamic json) {
    _id = json['id'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
    _price = json['price'];
    _seriesId = json['series_id'];
    _authorImage = json['author_image'];
    _authorName = json['author_name'];
    _issuer = json['issuer'];
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
    _threeD = json['three_d'];
    _shareImg = json['share_img'];
    _isShow = json['is_show'];
    if (json['detail'] != null) {
      _detail = [];
      json['detail'].forEach((v) {
        _detail?.add(Detail.fromJson(v));
      });
    }
  }
  int? _id;
  String? _goodsName;
  String? _goodsImage;
  String? _price;
  int? _seriesId;
  String? _authorImage;
  String? _authorName;
  String? _issuer;
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
  String? _threeD;
  String? _shareImg;
  int? _isShow;
  List<Detail>? _detail;
SynthesisListEntity copyWith({  int? id,
  String? goodsName,
  String? goodsImage,
  String? price,
  int? seriesId,
  String? authorImage,
  String? authorName,
  String? issuer,
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
  String? threeD,
  String? shareImg,
  int? isShow,
  List<Detail>? detail,
}) => SynthesisListEntity(  id: id ?? _id,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
  price: price ?? _price,
  seriesId: seriesId ?? _seriesId,
  authorImage: authorImage ?? _authorImage,
  authorName: authorName ?? _authorName,
  issuer: issuer ?? _issuer,
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
  threeD: threeD ?? _threeD,
  shareImg: shareImg ?? _shareImg,
  isShow: isShow ?? _isShow,
  detail: detail ?? _detail,
);
  int? get id => _id;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get price => _price;
  int? get seriesId => _seriesId;
  String? get authorImage => _authorImage;
  String? get authorName => _authorName;
  String? get issuer => _issuer;
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
  String? get threeD => _threeD;
  String? get shareImg => _shareImg;
  int? get isShow => _isShow;
  List<Detail>? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    map['price'] = _price;
    map['series_id'] = _seriesId;
    map['author_image'] = _authorImage;
    map['author_name'] = _authorName;
    map['issuer'] = _issuer;
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
    map['three_d'] = _threeD;
    map['share_img'] = _shareImg;
    map['is_show'] = _isShow;
    if (_detail != null) {
      map['detail'] = _detail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// synthetic_goods_id : 2
/// goods_name : "雪容绒F1"
/// num : 1
/// create_time : 1648448525
/// update_time : 1648448525
/// goods_image : "http://oos.ymhzf.com/16484471277594.jpeg"

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));
String detailToJson(Detail data) => json.encode(data.toJson());
class Detail {
  Detail({
      int? id, 
      int? syntheticGoodsId, 
      String? goodsName, 
      int? num, 
      int? createTime, 
      int? updateTime, 
      String? goodsImage,}){
    _id = id;
    _syntheticGoodsId = syntheticGoodsId;
    _goodsName = goodsName;
    _num = num;
    _createTime = createTime;
    _updateTime = updateTime;
    _goodsImage = goodsImage;
}

  Detail.fromJson(dynamic json) {
    _id = json['id'];
    _syntheticGoodsId = json['synthetic_goods_id'];
    _goodsName = json['goods_name'];
    _num = json['num'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _goodsImage = json['goods_image'];
  }
  int? _id;
  int? _syntheticGoodsId;
  String? _goodsName;
  int? _num;
  int? _createTime;
  int? _updateTime;
  String? _goodsImage;
Detail copyWith({  int? id,
  int? syntheticGoodsId,
  String? goodsName,
  int? num,
  int? createTime,
  int? updateTime,
  String? goodsImage,
}) => Detail(  id: id ?? _id,
  syntheticGoodsId: syntheticGoodsId ?? _syntheticGoodsId,
  goodsName: goodsName ?? _goodsName,
  num: num ?? _num,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  goodsImage: goodsImage ?? _goodsImage,
);
  int? get id => _id;
  int? get syntheticGoodsId => _syntheticGoodsId;
  String? get goodsName => _goodsName;
  int? get num => _num;
  int? get createTime => _createTime;
  int? get updateTime => _updateTime;
  String? get goodsImage => _goodsImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['synthetic_goods_id'] = _syntheticGoodsId;
    map['goods_name'] = _goodsName;
    map['num'] = _num;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['goods_image'] = _goodsImage;
    return map;
  }

}