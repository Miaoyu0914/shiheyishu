import 'dart:convert';
/// id : 169
/// member_id : 35922247
/// order_sn : "1202205100939012125"
/// goods_number : 49
/// goods_id : 5
/// status : 0
/// create_time : "2022-05-10 09:39:04"
/// update_time : "2022-05-10 09:39:04"
/// from : 1
/// order_id : 0
/// rent_time : 0
/// compose_time : 0
/// exchange_code_id : 0
/// is_nft : 1
/// hash : "0x1852998a66da3e2ec89ba85ac268b5c3f345c22530b963bac9a301448c1e63da"
/// token_id : 1470
/// transfer_time : 0
/// snapshot : "a:32:{s:2:\"id\";i:5;s:10:\"goods_name\";s:6:\"神将\";s:11:\"goods_image\";s:40:\"https://oss.ytsz.vip/16509400959262.jfif\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:3;s:12:\"author_image\";s:39:\"https://oss.ytsz.vip/16509401254739.png\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1652144435;s:9:\"limit_num\";i:1;s:12:\"show_minutes\";i:30;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1650940167;s:11:\"update_time\";i:1652146488;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT\";s:9:\"total_num\";i:4000;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:39:\"https://oss.ytsz.vip/16509401332131.png\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:6;s:6:\"status\";i:2;s:7:\"three_d\";s:39:\"http://oss.ytsz.vip/16520951125366.gltf\";s:4:\"info\";s:12:\"作品介绍\";s:9:\"share_img\";s:39:\"https://oss.ytsz.vip/16509401658084.png\";s:16:\"advance_goods_id\";i:0;s:11:\"advance_num\";i:0;s:11:\"series_name\";s:12:\"合成系列\";s:11:\"is_nft_desc\";s:3:\"是\";s:16:\"equity_type_desc\";s:9:\"衍生品\";}"
/// code : "dgGOTVXY07"
/// series_id : 3
/// blind_box_id : null
/// goods_name : "神将"
/// auto : 0
/// good : {"id":5,"goods_name":"神将","goods_image":"https://oss.ytsz.vip/16509400959262.jfif","price":"99.00","series_id":3,"author_image":"https://oss.ytsz.vip/16509401254739.png","author_name":"创作者名称","start_time":1652144435,"limit_num":1,"show_minutes":30,"issuer":"发行方名称","purchase_info":"购买须知","create_time":1650940167,"update_time":1652146488,"is_nft":1,"token_uri":"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT","total_num":4000,"author_info":"创作者简介","issuer_image":"https://oss.ytsz.vip/16509401332131.png","issuer_info":"发行方简介","equity_type":1,"standard":"ERC721","sale":6,"status":2,"three_d":"https://oss.ytsz.vip/16520951125366.gltf","info":"作品介绍","share_img":"https://oss.ytsz.vip/16509401658084.png","advance_goods_id":0,"advance_num":0,"series_name":"合成系列","is_nft_desc":"是","equity_type_desc":"衍生品"}
/// standard : "ERC721"
/// series_name : null
/// equity_type_desc : "衍生品"
/// logs : [{"id":156,"member_id":35922247,"code":"dgGOTVXY07","create_time":"2022-05-10 09:39:04","update_time":1652146744,"info":"铸造","price":"99.00","nickname":"15777777771","head_img":"http://oos.ymhzf.com/16458689466448.png"}]

MineNftDetailEntity mineNftDetailEntityFromJson(String str) => MineNftDetailEntity.fromJson(json.decode(str));
String mineNftDetailEntityToJson(MineNftDetailEntity data) => json.encode(data.toJson());
class MineNftDetailEntity {
  MineNftDetailEntity({
      int? id, 
      int? memberId, 
      String? orderSn, 
      int? goodsNumber, 
      int? goodsId, 
      int? status, 
      String? createTime, 
      String? updateTime, 
      int? from, 
      int? orderId, 
      int? rentTime, 
      int? composeTime, 
      int? exchangeCodeId, 
      int? isNft, 
      String? hash, 
      int? tokenId, 
      int? transferTime, 
      String? snapshot, 
      String? code, 
      int? seriesId, 
      dynamic blindBoxId, 
      String? goodsName, 
      int? auto, 
      Good? good, 
      String? standard, 
      dynamic seriesName, 
      String? equityTypeDesc, 
      List<Logs>? logs,}){
    _id = id;
    _memberId = memberId;
    _orderSn = orderSn;
    _goodsNumber = goodsNumber;
    _goodsId = goodsId;
    _status = status;
    _createTime = createTime;
    _updateTime = updateTime;
    _from = from;
    _orderId = orderId;
    _rentTime = rentTime;
    _composeTime = composeTime;
    _exchangeCodeId = exchangeCodeId;
    _isNft = isNft;
    _hash = hash;
    _tokenId = tokenId;
    _transferTime = transferTime;
    _snapshot = snapshot;
    _code = code;
    _seriesId = seriesId;
    _blindBoxId = blindBoxId;
    _goodsName = goodsName;
    _auto = auto;
    _good = good;
    _standard = standard;
    _seriesName = seriesName;
    _equityTypeDesc = equityTypeDesc;
    _logs = logs;
}

  MineNftDetailEntity.fromJson(dynamic json) {
    _id = json['id'];
    _memberId = json['member_id'];
    _orderSn = json['order_sn'];
    _goodsNumber = json['goods_number'];
    _goodsId = json['goods_id'];
    _status = json['status'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _from = json['from'];
    _orderId = json['order_id'];
    _rentTime = json['rent_time'];
    _composeTime = json['compose_time'];
    _exchangeCodeId = json['exchange_code_id'];
    _isNft = json['is_nft'];
    _hash = json['hash'];
    _tokenId = json['token_id'];
    _transferTime = json['transfer_time'];
    _snapshot = json['snapshot'];
    _code = json['code'];
    _seriesId = json['series_id'];
    _blindBoxId = json['blind_box_id'];
    _goodsName = json['goods_name'];
    _auto = json['auto'];
    _good = json['good'] != null ? Good.fromJson(json['good']) : null;
    _standard = json['standard'];
    _seriesName = json['series_name'];
    _equityTypeDesc = json['equity_type_desc'];
    if (json['logs'] != null) {
      _logs = [];
      json['logs'].forEach((v) {
        _logs?.add(Logs.fromJson(v));
      });
    }
  }
  int? _id;
  int? _memberId;
  String? _orderSn;
  int? _goodsNumber;
  int? _goodsId;
  int? _status;
  String? _createTime;
  String? _updateTime;
  int? _from;
  int? _orderId;
  int? _rentTime;
  int? _composeTime;
  int? _exchangeCodeId;
  int? _isNft;
  String? _hash;
  int? _tokenId;
  int? _transferTime;
  String? _snapshot;
  String? _code;
  int? _seriesId;
  dynamic _blindBoxId;
  String? _goodsName;
  int? _auto;
  Good? _good;
  String? _standard;
  dynamic _seriesName;
  String? _equityTypeDesc;
  List<Logs>? _logs;
MineNftDetailEntity copyWith({  int? id,
  int? memberId,
  String? orderSn,
  int? goodsNumber,
  int? goodsId,
  int? status,
  String? createTime,
  String? updateTime,
  int? from,
  int? orderId,
  int? rentTime,
  int? composeTime,
  int? exchangeCodeId,
  int? isNft,
  String? hash,
  int? tokenId,
  int? transferTime,
  String? snapshot,
  String? code,
  int? seriesId,
  dynamic blindBoxId,
  String? goodsName,
  int? auto,
  Good? good,
  String? standard,
  dynamic seriesName,
  String? equityTypeDesc,
  List<Logs>? logs,
}) => MineNftDetailEntity(  id: id ?? _id,
  memberId: memberId ?? _memberId,
  orderSn: orderSn ?? _orderSn,
  goodsNumber: goodsNumber ?? _goodsNumber,
  goodsId: goodsId ?? _goodsId,
  status: status ?? _status,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  from: from ?? _from,
  orderId: orderId ?? _orderId,
  rentTime: rentTime ?? _rentTime,
  composeTime: composeTime ?? _composeTime,
  exchangeCodeId: exchangeCodeId ?? _exchangeCodeId,
  isNft: isNft ?? _isNft,
  hash: hash ?? _hash,
  tokenId: tokenId ?? _tokenId,
  transferTime: transferTime ?? _transferTime,
  snapshot: snapshot ?? _snapshot,
  code: code ?? _code,
  seriesId: seriesId ?? _seriesId,
  blindBoxId: blindBoxId ?? _blindBoxId,
  goodsName: goodsName ?? _goodsName,
  auto: auto ?? _auto,
  good: good ?? _good,
  standard: standard ?? _standard,
  seriesName: seriesName ?? _seriesName,
  equityTypeDesc: equityTypeDesc ?? _equityTypeDesc,
  logs: logs ?? _logs,
);
  int? get id => _id;
  int? get memberId => _memberId;
  String? get orderSn => _orderSn;
  int? get goodsNumber => _goodsNumber;
  int? get goodsId => _goodsId;
  int? get status => _status;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  int? get from => _from;
  int? get orderId => _orderId;
  int? get rentTime => _rentTime;
  int? get composeTime => _composeTime;
  int? get exchangeCodeId => _exchangeCodeId;
  int? get isNft => _isNft;
  String? get hash => _hash;
  int? get tokenId => _tokenId;
  int? get transferTime => _transferTime;
  String? get snapshot => _snapshot;
  String? get code => _code;
  int? get seriesId => _seriesId;
  dynamic get blindBoxId => _blindBoxId;
  String? get goodsName => _goodsName;
  int? get auto => _auto;
  Good? get good => _good;
  String? get standard => _standard;
  dynamic get seriesName => _seriesName;
  String? get equityTypeDesc => _equityTypeDesc;
  List<Logs>? get logs => _logs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['member_id'] = _memberId;
    map['order_sn'] = _orderSn;
    map['goods_number'] = _goodsNumber;
    map['goods_id'] = _goodsId;
    map['status'] = _status;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['from'] = _from;
    map['order_id'] = _orderId;
    map['rent_time'] = _rentTime;
    map['compose_time'] = _composeTime;
    map['exchange_code_id'] = _exchangeCodeId;
    map['is_nft'] = _isNft;
    map['hash'] = _hash;
    map['token_id'] = _tokenId;
    map['transfer_time'] = _transferTime;
    map['snapshot'] = _snapshot;
    map['code'] = _code;
    map['series_id'] = _seriesId;
    map['blind_box_id'] = _blindBoxId;
    map['goods_name'] = _goodsName;
    map['auto'] = _auto;
    if (_good != null) {
      map['good'] = _good?.toJson();
    }
    map['standard'] = _standard;
    map['series_name'] = _seriesName;
    map['equity_type_desc'] = _equityTypeDesc;
    if (_logs != null) {
      map['logs'] = _logs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 156
/// member_id : 35922247
/// code : "dgGOTVXY07"
/// create_time : "2022-05-10 09:39:04"
/// update_time : 1652146744
/// info : "铸造"
/// price : "99.00"
/// nickname : "15777777771"
/// head_img : "http://oos.ymhzf.com/16458689466448.png"

Logs logsFromJson(String str) => Logs.fromJson(json.decode(str));
String logsToJson(Logs data) => json.encode(data.toJson());
class Logs {
  Logs({
      int? id, 
      int? memberId, 
      String? code, 
      String? createTime, 
      int? updateTime, 
      String? info, 
      String? price, 
      String? nickname, 
      String? headImg,}){
    _id = id;
    _memberId = memberId;
    _code = code;
    _createTime = createTime;
    _updateTime = updateTime;
    _info = info;
    _price = price;
    _nickname = nickname;
    _headImg = headImg;
}

  Logs.fromJson(dynamic json) {
    _id = json['id'];
    _memberId = json['member_id'];
    _code = json['code'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _info = json['info'];
    _price = json['price'];
    _nickname = json['nickname'];
    _headImg = json['head_img'];
  }
  int? _id;
  int? _memberId;
  String? _code;
  String? _createTime;
  int? _updateTime;
  String? _info;
  String? _price;
  String? _nickname;
  String? _headImg;
Logs copyWith({  int? id,
  int? memberId,
  String? code,
  String? createTime,
  int? updateTime,
  String? info,
  String? price,
  String? nickname,
  String? headImg,
}) => Logs(  id: id ?? _id,
  memberId: memberId ?? _memberId,
  code: code ?? _code,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  info: info ?? _info,
  price: price ?? _price,
  nickname: nickname ?? _nickname,
  headImg: headImg ?? _headImg,
);
  int? get id => _id;
  int? get memberId => _memberId;
  String? get code => _code;
  String? get createTime => _createTime;
  int? get updateTime => _updateTime;
  String? get info => _info;
  String? get price => _price;
  String? get nickname => _nickname;
  String? get headImg => _headImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['member_id'] = _memberId;
    map['code'] = _code;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['info'] = _info;
    map['price'] = _price;
    map['nickname'] = _nickname;
    map['head_img'] = _headImg;
    return map;
  }

}

/// id : 5
/// goods_name : "神将"
/// goods_image : "https://oss.ytsz.vip/16509400959262.jfif"
/// price : "99.00"
/// series_id : 3
/// author_image : "https://oss.ytsz.vip/16509401254739.png"
/// author_name : "创作者名称"
/// start_time : 1652144435
/// limit_num : 1
/// show_minutes : 30
/// issuer : "发行方名称"
/// purchase_info : "购买须知"
/// create_time : 1650940167
/// update_time : 1652146488
/// is_nft : 1
/// token_uri : "https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT"
/// total_num : 4000
/// author_info : "创作者简介"
/// issuer_image : "https://oss.ytsz.vip/16509401332131.png"
/// issuer_info : "发行方简介"
/// equity_type : 1
/// standard : "ERC721"
/// sale : 6
/// status : 2
/// three_d : "https://oss.ytsz.vip/16520951125366.gltf"
/// info : "作品介绍"
/// share_img : "https://oss.ytsz.vip/16509401658084.png"
/// advance_goods_id : 0
/// advance_num : 0
/// series_name : "合成系列"
/// is_nft_desc : "是"
/// equity_type_desc : "衍生品"

Good goodFromJson(String str) => Good.fromJson(json.decode(str));
String goodToJson(Good data) => json.encode(data.toJson());
class Good {
  Good({
      int? id, 
      String? goodsName, 
      String? goodsImage, 
      String? price, 
      int? seriesId, 
      String? authorImage, 
      String? authorName, 
      int? startTime, 
      int? limitNum, 
      int? showMinutes, 
      String? issuer, 
      String? purchaseInfo, 
      int? createTime, 
      int? updateTime, 
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
      String? isNftDesc, 
      String? equityTypeDesc,}){
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
    _isNftDesc = isNftDesc;
    _equityTypeDesc = equityTypeDesc;
}

  Good.fromJson(dynamic json) {
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
    _isNftDesc = json['is_nft_desc'];
    _equityTypeDesc = json['equity_type_desc'];
  }
  int? _id;
  String? _goodsName;
  String? _goodsImage;
  String? _price;
  int? _seriesId;
  String? _authorImage;
  String? _authorName;
  int? _startTime;
  int? _limitNum;
  int? _showMinutes;
  String? _issuer;
  String? _purchaseInfo;
  int? _createTime;
  int? _updateTime;
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
  String? _isNftDesc;
  String? _equityTypeDesc;
Good copyWith({  int? id,
  String? goodsName,
  String? goodsImage,
  String? price,
  int? seriesId,
  String? authorImage,
  String? authorName,
  int? startTime,
  int? limitNum,
  int? showMinutes,
  String? issuer,
  String? purchaseInfo,
  int? createTime,
  int? updateTime,
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
  String? isNftDesc,
  String? equityTypeDesc,
}) => Good(  id: id ?? _id,
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
  isNftDesc: isNftDesc ?? _isNftDesc,
  equityTypeDesc: equityTypeDesc ?? _equityTypeDesc,
);
  int? get id => _id;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get price => _price;
  int? get seriesId => _seriesId;
  String? get authorImage => _authorImage;
  String? get authorName => _authorName;
  int? get startTime => _startTime;
  int? get limitNum => _limitNum;
  int? get showMinutes => _showMinutes;
  String? get issuer => _issuer;
  String? get purchaseInfo => _purchaseInfo;
  int? get createTime => _createTime;
  int? get updateTime => _updateTime;
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
  String? get isNftDesc => _isNftDesc;
  String? get equityTypeDesc => _equityTypeDesc;

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
    map['is_nft_desc'] = _isNftDesc;
    map['equity_type_desc'] = _equityTypeDesc;
    return map;
  }

}