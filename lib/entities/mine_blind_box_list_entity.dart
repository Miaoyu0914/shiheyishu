import 'dart:convert';
/// total : 1
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":106,"blind_box_id":5,"order_sn":"7202205040858350406","member_id":1,"status":1,"pay_type":3,"pay_time":"2022-05-04 08:58:39","create_time":"2022-05-04 08:58:35","update_time":"2022-05-04 08:58:35","cancel_time":"1970-01-01 08:00:00","snapshot":"a:26:{s:2:\"id\";i:5;s:4:\"name\";s:7:\"测试1\";s:5:\"image\";s:38:\"http://oss.ytsz.vip/16515860804295.png\";s:3:\"num\";i:5000;s:9:\"limit_num\";i:6;s:4:\"sale\";i:17;s:5:\"price\";s:4:\"0.01\";s:11:\"create_time\";i:1651586196;s:11:\"update_time\";i:1651625648;s:11:\"author_name\";s:3:\"111\";s:12:\"author_image\";s:38:\"http://oss.ytsz.vip/16515861597726.png\";s:11:\"author_info\";s:6:\"111111\";s:6:\"issuer\";s:3:\"111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515861657655.png\";s:11:\"issuer_info\";s:3:\"111\";s:7:\"content\";s:38:\"<p>111</p><p></p><p></p><p></p><p></p>\";s:6:\"status\";i:2;s:8:\"start_at\";i:1633190400;s:6:\"end_at\";i:1653699169;s:13:\"purchase_info\";s:3:\"111\";s:7:\"is_home\";i:1;s:4:\"info\";s:4:\"1111\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515861921218.png\";s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16515861172769.gltf\";s:9:\"reg_start\";i:15638400;s:7:\"reg_end\";i:1651625647;}","good_snapshot":"a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651586309;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:5:\"39.99\";s:4:\"sale\";i:6;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16515840291814.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}","price":"0.01","goods_id":6,"open":0,"open_time":null,"box":{"id":5,"name":"测试1","image":"http://oss.ytsz.vip/16515860804295.png","num":5000,"limit_num":6,"sale":17,"price":"0.01","create_time":1651586196,"update_time":1651625648,"author_name":"111","author_image":"http://oss.ytsz.vip/16515861597726.png","author_info":"111111","issuer":"111","issuer_image":"http://oss.ytsz.vip/16515861657655.png","issuer_info":"111","content":"<p>111</p><p></p><p></p><p></p><p></p>","status":2,"start_at":1633190400,"end_at":1653699169,"purchase_info":"111","is_home":1,"info":"1111","share_img":"http://oss.ytsz.vip/16515861921218.png","three_d":"http://oss.ytsz.vip/16515861172769.gltf","reg_start":15638400,"reg_end":1651625647},"good":{"id":6,"blind_box_id":5,"goods_name":"虎棒子","goods_image":"http://oss.ytsz.vip/16515840184887.jpg","price":"0.01","series_id":1,"author_image":"http://oss.ytsz.vip/16515841123968.gltf","author_name":"11111","start_time":0,"issuer":"1111","purchase_info":"11111","create_time":1651584134,"update_time":1651586309,"is_nft":0,"token_uri":"","author_info":"11111","issuer_image":"http://oss.ytsz.vip/16515841245065.jpg","issuer_info":"1111","standard":"erc721","probability":"39.99","sale":6,"num":8088,"three_d":"http://oss.ytsz.vip/16515840291814.gltf","share_img":"http://oss.ytsz.vip/16515841317740.jpg","equity_type":1}}]

MineBlindBoxListEntity mineBlindBoxListEntityFromJson(String str) => MineBlindBoxListEntity.fromJson(json.decode(str));
String mineBlindBoxListEntityToJson(MineBlindBoxListEntity data) => json.encode(data.toJson());
class MineBlindBoxListEntity {
  MineBlindBoxListEntity({
      int? total, 
      int? perPage, 
      int? currentPage, 
      int? lastPage, 
      List<Data>? data,}){
    _total = total;
    _perPage = perPage;
    _currentPage = currentPage;
    _lastPage = lastPage;
    _data = data;
}

  MineBlindBoxListEntity.fromJson(dynamic json) {
    _total = json['total'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  int? _total;
  int? _perPage;
  int? _currentPage;
  int? _lastPage;
  List<Data>? _data;
MineBlindBoxListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => MineBlindBoxListEntity(  total: total ?? _total,
  perPage: perPage ?? _perPage,
  currentPage: currentPage ?? _currentPage,
  lastPage: lastPage ?? _lastPage,
  data: data ?? _data,
);
  int? get total => _total;
  int? get perPage => _perPage;
  int? get currentPage => _currentPage;
  int? get lastPage => _lastPage;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['per_page'] = _perPage;
    map['current_page'] = _currentPage;
    map['last_page'] = _lastPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 106
/// blind_box_id : 5
/// order_sn : "7202205040858350406"
/// member_id : 1
/// status : 1
/// pay_type : 3
/// pay_time : "2022-05-04 08:58:39"
/// create_time : "2022-05-04 08:58:35"
/// update_time : "2022-05-04 08:58:35"
/// cancel_time : "1970-01-01 08:00:00"
/// snapshot : "a:26:{s:2:\"id\";i:5;s:4:\"name\";s:7:\"测试1\";s:5:\"image\";s:38:\"http://oss.ytsz.vip/16515860804295.png\";s:3:\"num\";i:5000;s:9:\"limit_num\";i:6;s:4:\"sale\";i:17;s:5:\"price\";s:4:\"0.01\";s:11:\"create_time\";i:1651586196;s:11:\"update_time\";i:1651625648;s:11:\"author_name\";s:3:\"111\";s:12:\"author_image\";s:38:\"http://oss.ytsz.vip/16515861597726.png\";s:11:\"author_info\";s:6:\"111111\";s:6:\"issuer\";s:3:\"111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515861657655.png\";s:11:\"issuer_info\";s:3:\"111\";s:7:\"content\";s:38:\"<p>111</p><p></p><p></p><p></p><p></p>\";s:6:\"status\";i:2;s:8:\"start_at\";i:1633190400;s:6:\"end_at\";i:1653699169;s:13:\"purchase_info\";s:3:\"111\";s:7:\"is_home\";i:1;s:4:\"info\";s:4:\"1111\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515861921218.png\";s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16515861172769.gltf\";s:9:\"reg_start\";i:15638400;s:7:\"reg_end\";i:1651625647;}"
/// good_snapshot : "a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651586309;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:5:\"39.99\";s:4:\"sale\";i:6;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16515840291814.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}"
/// price : "0.01"
/// goods_id : 6
/// open : 0
/// open_time : null
/// box : {"id":5,"name":"测试1","image":"http://oss.ytsz.vip/16515860804295.png","num":5000,"limit_num":6,"sale":17,"price":"0.01","create_time":1651586196,"update_time":1651625648,"author_name":"111","author_image":"http://oss.ytsz.vip/16515861597726.png","author_info":"111111","issuer":"111","issuer_image":"http://oss.ytsz.vip/16515861657655.png","issuer_info":"111","content":"<p>111</p><p></p><p></p><p></p><p></p>","status":2,"start_at":1633190400,"end_at":1653699169,"purchase_info":"111","is_home":1,"info":"1111","share_img":"http://oss.ytsz.vip/16515861921218.png","three_d":"http://oss.ytsz.vip/16515861172769.gltf","reg_start":15638400,"reg_end":1651625647}
/// good : {"id":6,"blind_box_id":5,"goods_name":"虎棒子","goods_image":"http://oss.ytsz.vip/16515840184887.jpg","price":"0.01","series_id":1,"author_image":"http://oss.ytsz.vip/16515841123968.gltf","author_name":"11111","start_time":0,"issuer":"1111","purchase_info":"11111","create_time":1651584134,"update_time":1651586309,"is_nft":0,"token_uri":"","author_info":"11111","issuer_image":"http://oss.ytsz.vip/16515841245065.jpg","issuer_info":"1111","standard":"erc721","probability":"39.99","sale":6,"num":8088,"three_d":"http://oss.ytsz.vip/16515840291814.gltf","share_img":"http://oss.ytsz.vip/16515841317740.jpg","equity_type":1}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? blindBoxId, 
      String? orderSn, 
      int? memberId, 
      int? status, 
      int? payType, 
      String? payTime, 
      String? createTime, 
      String? updateTime, 
      String? cancelTime, 
      String? snapshot, 
      String? goodSnapshot, 
      String? price, 
      int? goodsId, 
      int? open, 
      dynamic openTime, 
      Box? box, 
      Good? good,}){
    _id = id;
    _blindBoxId = blindBoxId;
    _orderSn = orderSn;
    _memberId = memberId;
    _status = status;
    _payType = payType;
    _payTime = payTime;
    _createTime = createTime;
    _updateTime = updateTime;
    _cancelTime = cancelTime;
    _snapshot = snapshot;
    _goodSnapshot = goodSnapshot;
    _price = price;
    _goodsId = goodsId;
    _open = open;
    _openTime = openTime;
    _box = box;
    _good = good;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _blindBoxId = json['blind_box_id'];
    _orderSn = json['order_sn'];
    _memberId = json['member_id'];
    _status = json['status'];
    _payType = json['pay_type'];
    _payTime = json['pay_time'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _cancelTime = json['cancel_time'];
    _snapshot = json['snapshot'];
    _goodSnapshot = json['good_snapshot'];
    _price = json['price'];
    _goodsId = json['goods_id'];
    _open = json['open'];
    _openTime = json['open_time'];
    _box = json['box'] != null ? Box.fromJson(json['box']) : null;
    _good = json['good'] != null ? Good.fromJson(json['good']) : null;
  }
  int? _id;
  int? _blindBoxId;
  String? _orderSn;
  int? _memberId;
  int? _status;
  int? _payType;
  String? _payTime;
  String? _createTime;
  String? _updateTime;
  String? _cancelTime;
  String? _snapshot;
  String? _goodSnapshot;
  String? _price;
  int? _goodsId;
  int? _open;
  dynamic _openTime;
  Box? _box;
  Good? _good;
Data copyWith({  int? id,
  int? blindBoxId,
  String? orderSn,
  int? memberId,
  int? status,
  int? payType,
  String? payTime,
  String? createTime,
  String? updateTime,
  String? cancelTime,
  String? snapshot,
  String? goodSnapshot,
  String? price,
  int? goodsId,
  int? open,
  dynamic openTime,
  Box? box,
  Good? good,
}) => Data(  id: id ?? _id,
  blindBoxId: blindBoxId ?? _blindBoxId,
  orderSn: orderSn ?? _orderSn,
  memberId: memberId ?? _memberId,
  status: status ?? _status,
  payType: payType ?? _payType,
  payTime: payTime ?? _payTime,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  cancelTime: cancelTime ?? _cancelTime,
  snapshot: snapshot ?? _snapshot,
  goodSnapshot: goodSnapshot ?? _goodSnapshot,
  price: price ?? _price,
  goodsId: goodsId ?? _goodsId,
  open: open ?? _open,
  openTime: openTime ?? _openTime,
  box: box ?? _box,
  good: good ?? _good,
);
  int? get id => _id;
  int? get blindBoxId => _blindBoxId;
  String? get orderSn => _orderSn;
  int? get memberId => _memberId;
  int? get status => _status;
  int? get payType => _payType;
  String? get payTime => _payTime;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get cancelTime => _cancelTime;
  String? get snapshot => _snapshot;
  String? get goodSnapshot => _goodSnapshot;
  String? get price => _price;
  int? get goodsId => _goodsId;
  int? get open => _open;
  dynamic get openTime => _openTime;
  Box? get box => _box;
  Good? get good => _good;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['blind_box_id'] = _blindBoxId;
    map['order_sn'] = _orderSn;
    map['member_id'] = _memberId;
    map['status'] = _status;
    map['pay_type'] = _payType;
    map['pay_time'] = _payTime;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['cancel_time'] = _cancelTime;
    map['snapshot'] = _snapshot;
    map['good_snapshot'] = _goodSnapshot;
    map['price'] = _price;
    map['goods_id'] = _goodsId;
    map['open'] = _open;
    map['open_time'] = _openTime;
    if (_box != null) {
      map['box'] = _box?.toJson();
    }
    if (_good != null) {
      map['good'] = _good?.toJson();
    }
    return map;
  }

}

/// id : 6
/// blind_box_id : 5
/// goods_name : "虎棒子"
/// goods_image : "http://oss.ytsz.vip/16515840184887.jpg"
/// price : "0.01"
/// series_id : 1
/// author_image : "http://oss.ytsz.vip/16515841123968.gltf"
/// author_name : "11111"
/// start_time : 0
/// issuer : "1111"
/// purchase_info : "11111"
/// create_time : 1651584134
/// update_time : 1651586309
/// is_nft : 0
/// token_uri : ""
/// author_info : "11111"
/// issuer_image : "http://oss.ytsz.vip/16515841245065.jpg"
/// issuer_info : "1111"
/// standard : "erc721"
/// probability : "39.99"
/// sale : 6
/// num : 8088
/// three_d : "http://oss.ytsz.vip/16515840291814.gltf"
/// share_img : "http://oss.ytsz.vip/16515841317740.jpg"
/// equity_type : 1

Good goodFromJson(String str) => Good.fromJson(json.decode(str));
String goodToJson(Good data) => json.encode(data.toJson());
class Good {
  Good({
      int? id, 
      int? blindBoxId, 
      String? goodsName, 
      String? goodsImage, 
      String? price, 
      int? seriesId, 
      String? authorImage, 
      String? authorName, 
      int? startTime, 
      String? issuer, 
      String? purchaseInfo, 
      int? createTime, 
      int? updateTime, 
      int? isNft, 
      String? tokenUri, 
      String? authorInfo, 
      String? issuerImage, 
      String? issuerInfo, 
      String? standard, 
      String? probability, 
      int? sale, 
      int? num, 
      String? threeD, 
      String? shareImg, 
      int? equityType,}){
    _id = id;
    _blindBoxId = blindBoxId;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
    _price = price;
    _seriesId = seriesId;
    _authorImage = authorImage;
    _authorName = authorName;
    _startTime = startTime;
    _issuer = issuer;
    _purchaseInfo = purchaseInfo;
    _createTime = createTime;
    _updateTime = updateTime;
    _isNft = isNft;
    _tokenUri = tokenUri;
    _authorInfo = authorInfo;
    _issuerImage = issuerImage;
    _issuerInfo = issuerInfo;
    _standard = standard;
    _probability = probability;
    _sale = sale;
    _num = num;
    _threeD = threeD;
    _shareImg = shareImg;
    _equityType = equityType;
}

  Good.fromJson(dynamic json) {
    _id = json['id'];
    _blindBoxId = json['blind_box_id'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
    _price = json['price'];
    _seriesId = json['series_id'];
    _authorImage = json['author_image'];
    _authorName = json['author_name'];
    _startTime = json['start_time'];
    _issuer = json['issuer'];
    _purchaseInfo = json['purchase_info'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _isNft = json['is_nft'];
    _tokenUri = json['token_uri'];
    _authorInfo = json['author_info'];
    _issuerImage = json['issuer_image'];
    _issuerInfo = json['issuer_info'];
    _standard = json['standard'];
    _probability = json['probability'];
    _sale = json['sale'];
    _num = json['num'];
    _threeD = json['three_d'];
    _shareImg = json['share_img'];
    _equityType = json['equity_type'];
  }
  int? _id;
  int? _blindBoxId;
  String? _goodsName;
  String? _goodsImage;
  String? _price;
  int? _seriesId;
  String? _authorImage;
  String? _authorName;
  int? _startTime;
  String? _issuer;
  String? _purchaseInfo;
  int? _createTime;
  int? _updateTime;
  int? _isNft;
  String? _tokenUri;
  String? _authorInfo;
  String? _issuerImage;
  String? _issuerInfo;
  String? _standard;
  String? _probability;
  int? _sale;
  int? _num;
  String? _threeD;
  String? _shareImg;
  int? _equityType;
Good copyWith({  int? id,
  int? blindBoxId,
  String? goodsName,
  String? goodsImage,
  String? price,
  int? seriesId,
  String? authorImage,
  String? authorName,
  int? startTime,
  String? issuer,
  String? purchaseInfo,
  int? createTime,
  int? updateTime,
  int? isNft,
  String? tokenUri,
  String? authorInfo,
  String? issuerImage,
  String? issuerInfo,
  String? standard,
  String? probability,
  int? sale,
  int? num,
  String? threeD,
  String? shareImg,
  int? equityType,
}) => Good(  id: id ?? _id,
  blindBoxId: blindBoxId ?? _blindBoxId,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
  price: price ?? _price,
  seriesId: seriesId ?? _seriesId,
  authorImage: authorImage ?? _authorImage,
  authorName: authorName ?? _authorName,
  startTime: startTime ?? _startTime,
  issuer: issuer ?? _issuer,
  purchaseInfo: purchaseInfo ?? _purchaseInfo,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  isNft: isNft ?? _isNft,
  tokenUri: tokenUri ?? _tokenUri,
  authorInfo: authorInfo ?? _authorInfo,
  issuerImage: issuerImage ?? _issuerImage,
  issuerInfo: issuerInfo ?? _issuerInfo,
  standard: standard ?? _standard,
  probability: probability ?? _probability,
  sale: sale ?? _sale,
  num: num ?? _num,
  threeD: threeD ?? _threeD,
  shareImg: shareImg ?? _shareImg,
  equityType: equityType ?? _equityType,
);
  int? get id => _id;
  int? get blindBoxId => _blindBoxId;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get price => _price;
  int? get seriesId => _seriesId;
  String? get authorImage => _authorImage;
  String? get authorName => _authorName;
  int? get startTime => _startTime;
  String? get issuer => _issuer;
  String? get purchaseInfo => _purchaseInfo;
  int? get createTime => _createTime;
  int? get updateTime => _updateTime;
  int? get isNft => _isNft;
  String? get tokenUri => _tokenUri;
  String? get authorInfo => _authorInfo;
  String? get issuerImage => _issuerImage;
  String? get issuerInfo => _issuerInfo;
  String? get standard => _standard;
  String? get probability => _probability;
  int? get sale => _sale;
  int? get num => _num;
  String? get threeD => _threeD;
  String? get shareImg => _shareImg;
  int? get equityType => _equityType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['blind_box_id'] = _blindBoxId;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    map['price'] = _price;
    map['series_id'] = _seriesId;
    map['author_image'] = _authorImage;
    map['author_name'] = _authorName;
    map['start_time'] = _startTime;
    map['issuer'] = _issuer;
    map['purchase_info'] = _purchaseInfo;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['is_nft'] = _isNft;
    map['token_uri'] = _tokenUri;
    map['author_info'] = _authorInfo;
    map['issuer_image'] = _issuerImage;
    map['issuer_info'] = _issuerInfo;
    map['standard'] = _standard;
    map['probability'] = _probability;
    map['sale'] = _sale;
    map['num'] = _num;
    map['three_d'] = _threeD;
    map['share_img'] = _shareImg;
    map['equity_type'] = _equityType;
    return map;
  }

}

/// id : 5
/// name : "测试1"
/// image : "http://oss.ytsz.vip/16515860804295.png"
/// num : 5000
/// limit_num : 6
/// sale : 17
/// price : "0.01"
/// create_time : 1651586196
/// update_time : 1651625648
/// author_name : "111"
/// author_image : "http://oss.ytsz.vip/16515861597726.png"
/// author_info : "111111"
/// issuer : "111"
/// issuer_image : "http://oss.ytsz.vip/16515861657655.png"
/// issuer_info : "111"
/// content : "<p>111</p><p></p><p></p><p></p><p></p>"
/// status : 2
/// start_at : 1633190400
/// end_at : 1653699169
/// purchase_info : "111"
/// is_home : 1
/// info : "1111"
/// share_img : "http://oss.ytsz.vip/16515861921218.png"
/// three_d : "http://oss.ytsz.vip/16515861172769.gltf"
/// reg_start : 15638400
/// reg_end : 1651625647

Box boxFromJson(String str) => Box.fromJson(json.decode(str));
String boxToJson(Box data) => json.encode(data.toJson());
class Box {
  Box({
      int? id, 
      String? name, 
      String? image, 
      int? num, 
      int? limitNum, 
      int? sale, 
      String? price, 
      int? createTime, 
      int? updateTime, 
      String? authorName, 
      String? authorImage, 
      String? authorInfo, 
      String? issuer, 
      String? issuerImage, 
      String? issuerInfo, 
      String? content, 
      int? status, 
      int? startAt, 
      int? endAt, 
      String? purchaseInfo, 
      int? isHome, 
      String? info, 
      String? shareImg, 
      String? threeD, 
      int? regStart, 
      int? regEnd,}){
    _id = id;
    _name = name;
    _image = image;
    _num = num;
    _limitNum = limitNum;
    _sale = sale;
    _price = price;
    _createTime = createTime;
    _updateTime = updateTime;
    _authorName = authorName;
    _authorImage = authorImage;
    _authorInfo = authorInfo;
    _issuer = issuer;
    _issuerImage = issuerImage;
    _issuerInfo = issuerInfo;
    _content = content;
    _status = status;
    _startAt = startAt;
    _endAt = endAt;
    _purchaseInfo = purchaseInfo;
    _isHome = isHome;
    _info = info;
    _shareImg = shareImg;
    _threeD = threeD;
    _regStart = regStart;
    _regEnd = regEnd;
}

  Box.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _num = json['num'];
    _limitNum = json['limit_num'];
    _sale = json['sale'];
    _price = json['price'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _authorName = json['author_name'];
    _authorImage = json['author_image'];
    _authorInfo = json['author_info'];
    _issuer = json['issuer'];
    _issuerImage = json['issuer_image'];
    _issuerInfo = json['issuer_info'];
    _content = json['content'];
    _status = json['status'];
    _startAt = json['start_at'];
    _endAt = json['end_at'];
    _purchaseInfo = json['purchase_info'];
    _isHome = json['is_home'];
    _info = json['info'];
    _shareImg = json['share_img'];
    _threeD = json['three_d'];
    _regStart = json['reg_start'];
    _regEnd = json['reg_end'];
  }
  int? _id;
  String? _name;
  String? _image;
  int? _num;
  int? _limitNum;
  int? _sale;
  String? _price;
  int? _createTime;
  int? _updateTime;
  String? _authorName;
  String? _authorImage;
  String? _authorInfo;
  String? _issuer;
  String? _issuerImage;
  String? _issuerInfo;
  String? _content;
  int? _status;
  int? _startAt;
  int? _endAt;
  String? _purchaseInfo;
  int? _isHome;
  String? _info;
  String? _shareImg;
  String? _threeD;
  int? _regStart;
  int? _regEnd;
Box copyWith({  int? id,
  String? name,
  String? image,
  int? num,
  int? limitNum,
  int? sale,
  String? price,
  int? createTime,
  int? updateTime,
  String? authorName,
  String? authorImage,
  String? authorInfo,
  String? issuer,
  String? issuerImage,
  String? issuerInfo,
  String? content,
  int? status,
  int? startAt,
  int? endAt,
  String? purchaseInfo,
  int? isHome,
  String? info,
  String? shareImg,
  String? threeD,
  int? regStart,
  int? regEnd,
}) => Box(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  num: num ?? _num,
  limitNum: limitNum ?? _limitNum,
  sale: sale ?? _sale,
  price: price ?? _price,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  authorName: authorName ?? _authorName,
  authorImage: authorImage ?? _authorImage,
  authorInfo: authorInfo ?? _authorInfo,
  issuer: issuer ?? _issuer,
  issuerImage: issuerImage ?? _issuerImage,
  issuerInfo: issuerInfo ?? _issuerInfo,
  content: content ?? _content,
  status: status ?? _status,
  startAt: startAt ?? _startAt,
  endAt: endAt ?? _endAt,
  purchaseInfo: purchaseInfo ?? _purchaseInfo,
  isHome: isHome ?? _isHome,
  info: info ?? _info,
  shareImg: shareImg ?? _shareImg,
  threeD: threeD ?? _threeD,
  regStart: regStart ?? _regStart,
  regEnd: regEnd ?? _regEnd,
);
  int? get id => _id;
  String? get name => _name;
  String? get image => _image;
  int? get num => _num;
  int? get limitNum => _limitNum;
  int? get sale => _sale;
  String? get price => _price;
  int? get createTime => _createTime;
  int? get updateTime => _updateTime;
  String? get authorName => _authorName;
  String? get authorImage => _authorImage;
  String? get authorInfo => _authorInfo;
  String? get issuer => _issuer;
  String? get issuerImage => _issuerImage;
  String? get issuerInfo => _issuerInfo;
  String? get content => _content;
  int? get status => _status;
  int? get startAt => _startAt;
  int? get endAt => _endAt;
  String? get purchaseInfo => _purchaseInfo;
  int? get isHome => _isHome;
  String? get info => _info;
  String? get shareImg => _shareImg;
  String? get threeD => _threeD;
  int? get regStart => _regStart;
  int? get regEnd => _regEnd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['num'] = _num;
    map['limit_num'] = _limitNum;
    map['sale'] = _sale;
    map['price'] = _price;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['author_name'] = _authorName;
    map['author_image'] = _authorImage;
    map['author_info'] = _authorInfo;
    map['issuer'] = _issuer;
    map['issuer_image'] = _issuerImage;
    map['issuer_info'] = _issuerInfo;
    map['content'] = _content;
    map['status'] = _status;
    map['start_at'] = _startAt;
    map['end_at'] = _endAt;
    map['purchase_info'] = _purchaseInfo;
    map['is_home'] = _isHome;
    map['info'] = _info;
    map['share_img'] = _shareImg;
    map['three_d'] = _threeD;
    map['reg_start'] = _regStart;
    map['reg_end'] = _regEnd;
    return map;
  }

}