import 'dart:convert';
/// total : 6
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":14,"rent_sn":"3202205091715478146","member_id":1,"goods_id":6,"space_id":155,"series_id":1,"status":0,"good_snapshot":"a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651629101;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:6:\"39.990\";s:4:\"sale\";i:13;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16516290949232.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}","space_snapshot":"a:23:{s:2:\"id\";i:155;s:9:\"member_id\";i:1;s:8:\"order_sn\";s:19:\"7202205041008006772\";s:12:\"goods_number\";i:39;s:8:\"goods_id\";i:6;s:6:\"status\";i:0;s:11:\"create_time\";i:1651630098;s:11:\"update_time\";i:1651630098;s:4:\"from\";i:3;s:8:\"order_id\";i:0;s:9:\"rent_time\";i:0;s:12:\"compose_time\";i:0;s:16:\"exchange_code_id\";i:0;s:6:\"is_nft\";i:0;s:4:\"hash\";s:67:\"0x843e95afe272f6e0a51bac23bcba0f4a97b5fb4fc81e71839ee3753006b53e920\";s:8:\"token_id\";i:0;s:13:\"transfer_time\";i:0;s:8:\"snapshot\";s:833:\"a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651629101;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:6:\"39.990\";s:4:\"sale\";i:13;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16516290949232.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}\";s:4:\"code\";s:6:\"dexCIK\";s:9:\"series_id\";i:1;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:4:\"auto\";i:0;}","create_time":"2022-05-09 17:15:47","update_time":"2022-05-09 17:15:47","match_time":"2022-05-19 13:44:35","pay_time":"2022-05-19 13:44:47","pay_fee":"25.00","service_fee":"25.00","copyright_fee":"25.00","hash":"0x843e95afe272f6e0a51bac23bcba0f4a97b5fb4fc81e71839ee3753006b53e920","token_id":0,"actual_price":"425.00","cancel_time":0,"price":"500.00","is_nft":0,"from":3,"has_id":2,"goods_name":"虎棒子","nickname":"44444","head_img":"https://oss.ytsz.vip/16508770768000.gif","good":{"id":6,"blind_box_id":5,"goods_name":"虎棒子","goods_image":"http://oss.ytsz.vip/16515840184887.jpg","price":"0.01","series_id":1,"author_image":"http://oss.ytsz.vip/16515841123968.gltf","author_name":"11111","start_time":0,"issuer":"1111","purchase_info":"11111","create_time":1651584134,"update_time":1651629101,"is_nft":0,"token_uri":"","author_info":"11111","issuer_image":"http://oss.ytsz.vip/16515841245065.jpg","issuer_info":"1111","standard":"erc721","probability":"39.990","sale":13,"num":8088,"three_d":"http://oss.ytsz.vip/16516290949232.gltf","share_img":"http://oss.ytsz.vip/16515841317740.jpg","equity_type":1},"status_desc":"待转售"}]

MineMarketOutOrderEntity mineMarketOutOrderEntityFromJson(String str) => MineMarketOutOrderEntity.fromJson(json.decode(str));
String mineMarketOutOrderEntityToJson(MineMarketOutOrderEntity data) => json.encode(data.toJson());
class MineMarketOutOrderEntity {
  MineMarketOutOrderEntity({
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

  MineMarketOutOrderEntity.fromJson(dynamic json) {
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
MineMarketOutOrderEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => MineMarketOutOrderEntity(  total: total ?? _total,
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

/// id : 14
/// rent_sn : "3202205091715478146"
/// member_id : 1
/// goods_id : 6
/// space_id : 155
/// series_id : 1
/// status : 0
/// good_snapshot : "a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651629101;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:6:\"39.990\";s:4:\"sale\";i:13;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16516290949232.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}"
/// space_snapshot : "a:23:{s:2:\"id\";i:155;s:9:\"member_id\";i:1;s:8:\"order_sn\";s:19:\"7202205041008006772\";s:12:\"goods_number\";i:39;s:8:\"goods_id\";i:6;s:6:\"status\";i:0;s:11:\"create_time\";i:1651630098;s:11:\"update_time\";i:1651630098;s:4:\"from\";i:3;s:8:\"order_id\";i:0;s:9:\"rent_time\";i:0;s:12:\"compose_time\";i:0;s:16:\"exchange_code_id\";i:0;s:6:\"is_nft\";i:0;s:4:\"hash\";s:67:\"0x843e95afe272f6e0a51bac23bcba0f4a97b5fb4fc81e71839ee3753006b53e920\";s:8:\"token_id\";i:0;s:13:\"transfer_time\";i:0;s:8:\"snapshot\";s:833:\"a:25:{s:2:\"id\";i:6;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:11:\"goods_image\";s:38:\"http://oss.ytsz.vip/16515840184887.jpg\";s:5:\"price\";s:4:\"0.01\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oss.ytsz.vip/16515841123968.gltf\";s:11:\"author_name\";s:5:\"11111\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:4:\"1111\";s:13:\"purchase_info\";s:5:\"11111\";s:11:\"create_time\";i:1651584134;s:11:\"update_time\";i:1651629101;s:6:\"is_nft\";i:0;s:9:\"token_uri\";s:0:\"\";s:11:\"author_info\";s:5:\"11111\";s:12:\"issuer_image\";s:38:\"http://oss.ytsz.vip/16515841245065.jpg\";s:11:\"issuer_info\";s:4:\"1111\";s:8:\"standard\";s:6:\"erc721\";s:11:\"probability\";s:6:\"39.990\";s:4:\"sale\";i:13;s:3:\"num\";i:8088;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16516290949232.gltf\";s:9:\"share_img\";s:38:\"http://oss.ytsz.vip/16515841317740.jpg\";s:11:\"equity_type\";i:1;}\";s:4:\"code\";s:6:\"dexCIK\";s:9:\"series_id\";i:1;s:12:\"blind_box_id\";i:5;s:10:\"goods_name\";s:9:\"虎棒子\";s:4:\"auto\";i:0;}"
/// create_time : "2022-05-09 17:15:47"
/// update_time : "2022-05-09 17:15:47"
/// match_time : "2022-05-19 13:44:35"
/// pay_time : "2022-05-19 13:44:47"
/// pay_fee : "25.00"
/// service_fee : "25.00"
/// copyright_fee : "25.00"
/// hash : "0x843e95afe272f6e0a51bac23bcba0f4a97b5fb4fc81e71839ee3753006b53e920"
/// token_id : 0
/// actual_price : "425.00"
/// cancel_time : 0
/// price : "500.00"
/// is_nft : 0
/// from : 3
/// has_id : 2
/// goods_name : "虎棒子"
/// nickname : "44444"
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"
/// good : {"id":6,"blind_box_id":5,"goods_name":"虎棒子","goods_image":"http://oss.ytsz.vip/16515840184887.jpg","price":"0.01","series_id":1,"author_image":"http://oss.ytsz.vip/16515841123968.gltf","author_name":"11111","start_time":0,"issuer":"1111","purchase_info":"11111","create_time":1651584134,"update_time":1651629101,"is_nft":0,"token_uri":"","author_info":"11111","issuer_image":"http://oss.ytsz.vip/16515841245065.jpg","issuer_info":"1111","standard":"erc721","probability":"39.990","sale":13,"num":8088,"three_d":"http://oss.ytsz.vip/16516290949232.gltf","share_img":"http://oss.ytsz.vip/16515841317740.jpg","equity_type":1}
/// status_desc : "待转售"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? rentSn, 
      int? memberId, 
      int? goodsId, 
      int? spaceId, 
      int? seriesId, 
      int? status, 
      String? goodSnapshot, 
      String? spaceSnapshot, 
      String? createTime, 
      String? updateTime, 
      String? matchTime, 
      String? payTime, 
      String? payFee, 
      String? serviceFee, 
      String? copyrightFee, 
      String? hash, 
      int? tokenId, 
      String? actualPrice, 
      int? cancelTime, 
      String? price, 
      int? isNft, 
      int? from, 
      int? hasId, 
      String? goodsName, 
      String? nickname, 
      String? headImg, 
      Good? good, 
      String? statusDesc,}){
    _id = id;
    _rentSn = rentSn;
    _memberId = memberId;
    _goodsId = goodsId;
    _spaceId = spaceId;
    _seriesId = seriesId;
    _status = status;
    _goodSnapshot = goodSnapshot;
    _spaceSnapshot = spaceSnapshot;
    _createTime = createTime;
    _updateTime = updateTime;
    _matchTime = matchTime;
    _payTime = payTime;
    _payFee = payFee;
    _serviceFee = serviceFee;
    _copyrightFee = copyrightFee;
    _hash = hash;
    _tokenId = tokenId;
    _actualPrice = actualPrice;
    _cancelTime = cancelTime;
    _price = price;
    _isNft = isNft;
    _from = from;
    _hasId = hasId;
    _goodsName = goodsName;
    _nickname = nickname;
    _headImg = headImg;
    _good = good;
    _statusDesc = statusDesc;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _rentSn = json['rent_sn'];
    _memberId = json['member_id'];
    _goodsId = json['goods_id'];
    _spaceId = json['space_id'];
    _seriesId = json['series_id'];
    _status = json['status'];
    _goodSnapshot = json['good_snapshot'];
    _spaceSnapshot = json['space_snapshot'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _matchTime = json['match_time'];
    _payTime = json['pay_time'];
    _payFee = json['pay_fee'];
    _serviceFee = json['service_fee'];
    _copyrightFee = json['copyright_fee'];
    _hash = json['hash'];
    _tokenId = json['token_id'];
    _actualPrice = json['actual_price'];
    _cancelTime = json['cancel_time'];
    _price = json['price'];
    _isNft = json['is_nft'];
    _from = json['from'];
    _hasId = json['has_id'];
    _goodsName = json['goods_name'];
    _nickname = json['nickname'];
    _headImg = json['head_img'];
    _good = json['good'] != null ? Good.fromJson(json['good']) : null;
    _statusDesc = json['status_desc'];
  }
  int? _id;
  String? _rentSn;
  int? _memberId;
  int? _goodsId;
  int? _spaceId;
  int? _seriesId;
  int? _status;
  String? _goodSnapshot;
  String? _spaceSnapshot;
  String? _createTime;
  String? _updateTime;
  String? _matchTime;
  String? _payTime;
  String? _payFee;
  String? _serviceFee;
  String? _copyrightFee;
  String? _hash;
  int? _tokenId;
  String? _actualPrice;
  int? _cancelTime;
  String? _price;
  int? _isNft;
  int? _from;
  int? _hasId;
  String? _goodsName;
  String? _nickname;
  String? _headImg;
  Good? _good;
  String? _statusDesc;
Data copyWith({  int? id,
  String? rentSn,
  int? memberId,
  int? goodsId,
  int? spaceId,
  int? seriesId,
  int? status,
  String? goodSnapshot,
  String? spaceSnapshot,
  String? createTime,
  String? updateTime,
  String? matchTime,
  String? payTime,
  String? payFee,
  String? serviceFee,
  String? copyrightFee,
  String? hash,
  int? tokenId,
  String? actualPrice,
  int? cancelTime,
  String? price,
  int? isNft,
  int? from,
  int? hasId,
  String? goodsName,
  String? nickname,
  String? headImg,
  Good? good,
  String? statusDesc,
}) => Data(  id: id ?? _id,
  rentSn: rentSn ?? _rentSn,
  memberId: memberId ?? _memberId,
  goodsId: goodsId ?? _goodsId,
  spaceId: spaceId ?? _spaceId,
  seriesId: seriesId ?? _seriesId,
  status: status ?? _status,
  goodSnapshot: goodSnapshot ?? _goodSnapshot,
  spaceSnapshot: spaceSnapshot ?? _spaceSnapshot,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  matchTime: matchTime ?? _matchTime,
  payTime: payTime ?? _payTime,
  payFee: payFee ?? _payFee,
  serviceFee: serviceFee ?? _serviceFee,
  copyrightFee: copyrightFee ?? _copyrightFee,
  hash: hash ?? _hash,
  tokenId: tokenId ?? _tokenId,
  actualPrice: actualPrice ?? _actualPrice,
  cancelTime: cancelTime ?? _cancelTime,
  price: price ?? _price,
  isNft: isNft ?? _isNft,
  from: from ?? _from,
  hasId: hasId ?? _hasId,
  goodsName: goodsName ?? _goodsName,
  nickname: nickname ?? _nickname,
  headImg: headImg ?? _headImg,
  good: good ?? _good,
  statusDesc: statusDesc ?? _statusDesc,
);
  int? get id => _id;
  String? get rentSn => _rentSn;
  int? get memberId => _memberId;
  int? get goodsId => _goodsId;
  int? get spaceId => _spaceId;
  int? get seriesId => _seriesId;
  int? get status => _status;
  String? get goodSnapshot => _goodSnapshot;
  String? get spaceSnapshot => _spaceSnapshot;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get matchTime => _matchTime;
  String? get payTime => _payTime;
  String? get payFee => _payFee;
  String? get serviceFee => _serviceFee;
  String? get copyrightFee => _copyrightFee;
  String? get hash => _hash;
  int? get tokenId => _tokenId;
  String? get actualPrice => _actualPrice;
  int? get cancelTime => _cancelTime;
  String? get price => _price;
  int? get isNft => _isNft;
  int? get from => _from;
  int? get hasId => _hasId;
  String? get goodsName => _goodsName;
  String? get nickname => _nickname;
  String? get headImg => _headImg;
  Good? get good => _good;
  String? get statusDesc => _statusDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rent_sn'] = _rentSn;
    map['member_id'] = _memberId;
    map['goods_id'] = _goodsId;
    map['space_id'] = _spaceId;
    map['series_id'] = _seriesId;
    map['status'] = _status;
    map['good_snapshot'] = _goodSnapshot;
    map['space_snapshot'] = _spaceSnapshot;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['match_time'] = _matchTime;
    map['pay_time'] = _payTime;
    map['pay_fee'] = _payFee;
    map['service_fee'] = _serviceFee;
    map['copyright_fee'] = _copyrightFee;
    map['hash'] = _hash;
    map['token_id'] = _tokenId;
    map['actual_price'] = _actualPrice;
    map['cancel_time'] = _cancelTime;
    map['price'] = _price;
    map['is_nft'] = _isNft;
    map['from'] = _from;
    map['has_id'] = _hasId;
    map['goods_name'] = _goodsName;
    map['nickname'] = _nickname;
    map['head_img'] = _headImg;
    if (_good != null) {
      map['good'] = _good?.toJson();
    }
    map['status_desc'] = _statusDesc;
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
/// update_time : 1651629101
/// is_nft : 0
/// token_uri : ""
/// author_info : "11111"
/// issuer_image : "http://oss.ytsz.vip/16515841245065.jpg"
/// issuer_info : "1111"
/// standard : "erc721"
/// probability : "39.990"
/// sale : 13
/// num : 8088
/// three_d : "http://oss.ytsz.vip/16516290949232.gltf"
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