import 'dart:convert';
/// id : 2
/// rent_sn : "3202203290918260692"
/// member_id : 1
/// goods_id : 1
/// space_id : 22
/// series_id : 1
/// status : 0
/// good_snapshot : "a:25:{s:2:\"id\";i:1;s:10:\"goods_name\";s:11:\"冰墩墩F1\";s:11:\"goods_image\";s:40:\"http://oos.ymhzf.com/16484604934976.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oos.ymhzf.com/16484317809783.png\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1648431936;s:9:\"limit_num\";i:10000;s:12:\"show_minutes\";i:10;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1648431827;s:11:\"update_time\";i:1648513640;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT\";s:9:\"total_num\";i:50000;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:39:\"http://oos.ymhzf.com/16484317952741.png\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:3;s:6:\"status\";i:2;s:7:\"three_d\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj\";}"
/// space_snapshot : "a:22:{s:2:\"id\";i:22;s:9:\"member_id\";i:1;s:8:\"order_sn\";s:19:\"1202203290917305544\";s:12:\"goods_number\";i:3;s:8:\"goods_id\";i:1;s:6:\"status\";i:0;s:11:\"create_time\";i:1648516655;s:11:\"update_time\";i:1648516655;s:4:\"from\";i:1;s:8:\"order_id\";i:0;s:9:\"rent_time\";i:0;s:12:\"compose_time\";i:0;s:16:\"exchange_code_id\";i:0;s:6:\"is_nft\";i:1;s:4:\"hash\";s:66:\"0x7828595a28f740c988e35fb2c65c70f906966af3da2c2497d18cc9b730b5773a\";s:8:\"token_id\";i:30;s:13:\"transfer_time\";i:0;s:8:\"snapshot\";s:951:\"a:25:{s:2:\"id\";i:1;s:10:\"goods_name\";s:11:\"冰墩墩F1\";s:11:\"goods_image\";s:40:\"http://oos.ymhzf.com/16484604934976.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oos.ymhzf.com/16484317809783.png\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1648431936;s:9:\"limit_num\";i:10000;s:12:\"show_minutes\";i:10;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1648431827;s:11:\"update_time\";i:1648513640;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT\";s:9:\"total_num\";i:50000;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:39:\"http://oos.ymhzf.com/16484317952741.png\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:3;s:6:\"status\";i:2;s:7:\"three_d\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj\";}\";s:4:\"code\";s:6:\"rBEHM7\";s:9:\"series_id\";i:1;s:12:\"blind_box_id\";N;s:10:\"goods_name\";s:11:\"冰墩墩F1\";}"
/// create_time : "2022-03-29 09:18:26"
/// update_time : "2022-03-29 09:18:26"
/// match_time : "1970-01-01 08:00:00"
/// pay_time : "1970-01-01 08:00:00"
/// pay_fee : "5.00"
/// service_fee : "25.00"
/// copyright_fee : "5.00"
/// hash : "0x7828595a28f740c988e35fb2c65c70f906966af3da2c2497d18cc9b730b5773a"
/// token_id : 0
/// actual_price : "465.00"
/// cancel_time : 0
/// price : "500.00"
/// is_nft : 1
/// from : 1
/// has_id : null
/// goods_name : null
/// nickname : "44444"
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"
/// status_desc : "待转售"
/// status_info : "订单正在转售"
/// good : {"id":1,"goods_name":"冰墩墩F1","goods_image":"http://oos.ymhzf.com/16484604934976.jpeg","price":"99.00","series_id":1,"author_image":"http://oos.ymhzf.com/16484317809783.png","author_name":"创作者名称","start_time":1648431936,"limit_num":10000,"show_minutes":10,"issuer":"发行方名称","purchase_info":"购买须知","create_time":1648431827,"update_time":1648513640,"is_nft":1,"token_uri":"https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT","total_num":50000,"author_info":"创作者简介","issuer_image":"http://oos.ymhzf.com/16484317952741.png","issuer_info":"发行方简介","equity_type":1,"standard":"ERC721","sale":3,"status":2,"three_d":"https://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj"}
/// standard : "ERC721"
/// series_name : "冰墩墩系列"
/// equity_type_desc : "衍生品"
/// goods_number : 3
/// logs : [{"id":8,"member_id":1,"code":"rBEHM7","create_time":"2022-03-29 09:18:26","update_time":1648516706,"info":"挂售","price":"500.00","nickname":"44444","head_img":"https://oss.ytsz.vip/16508770768000.gif"},{"id":7,"member_id":1,"code":"rBEHM7","create_time":"2022-03-29 09:17:35","update_time":1648516655,"info":"铸造","price":"99.00","nickname":"44444","head_img":"https://oss.ytsz.vip/16508770768000.gif"}]

MarketDetailEntity marketDetailEntityFromJson(String str) => MarketDetailEntity.fromJson(json.decode(str));
String marketDetailEntityToJson(MarketDetailEntity data) => json.encode(data.toJson());
class MarketDetailEntity {
  MarketDetailEntity({
      int? id, 
      String? rentSn, 
      int? memberId, 
      int? goodsId, 
      int? spaceId, 
      int? seriesId, 
      int? status, 
      String? goodSnapshot, 
      String? spaceSnapshot,
    dynamic createTime,
    dynamic updateTime,
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
      dynamic hasId, 
      dynamic goodsName, 
      String? nickname, 
      String? headImg, 
      String? statusDesc, 
      String? statusInfo, 
      Good? good, 
      String? standard, 
      String? seriesName, 
      String? equityTypeDesc, 
      int? goodsNumber, 
      List<Logs>? logs,}){
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
    _statusDesc = statusDesc;
    _statusInfo = statusInfo;
    _good = good;
    _standard = standard;
    _seriesName = seriesName;
    _equityTypeDesc = equityTypeDesc;
    _goodsNumber = goodsNumber;
    _logs = logs;
}

  MarketDetailEntity.fromJson(dynamic json) {
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
    _statusDesc = json['status_desc'];
    _statusInfo = json['status_info'];
    _good = json['good'] != null ? Good.fromJson(json['good']) : null;
    _standard = json['standard'];
    _seriesName = json['series_name'];
    _equityTypeDesc = json['equity_type_desc'];
    _goodsNumber = json['goods_number'];
    if (json['logs'] != null) {
      _logs = [];
      json['logs'].forEach((v) {
        _logs?.add(Logs.fromJson(v));
      });
    }
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
  dynamic _createTime;
  dynamic _updateTime;
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
  dynamic _hasId;
  dynamic _goodsName;
  String? _nickname;
  String? _headImg;
  String? _statusDesc;
  String? _statusInfo;
  Good? _good;
  String? _standard;
  String? _seriesName;
  String? _equityTypeDesc;
  int? _goodsNumber;
  List<Logs>? _logs;
MarketDetailEntity copyWith({  int? id,
  String? rentSn,
  int? memberId,
  int? goodsId,
  int? spaceId,
  int? seriesId,
  int? status,
  String? goodSnapshot,
  String? spaceSnapshot,
  dynamic createTime,
  dynamic updateTime,
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
  dynamic hasId,
  dynamic goodsName,
  String? nickname,
  String? headImg,
  String? statusDesc,
  String? statusInfo,
  Good? good,
  String? standard,
  String? seriesName,
  String? equityTypeDesc,
  int? goodsNumber,
  List<Logs>? logs,
}) => MarketDetailEntity(  id: id ?? _id,
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
  statusDesc: statusDesc ?? _statusDesc,
  statusInfo: statusInfo ?? _statusInfo,
  good: good ?? _good,
  standard: standard ?? _standard,
  seriesName: seriesName ?? _seriesName,
  equityTypeDesc: equityTypeDesc ?? _equityTypeDesc,
  goodsNumber: goodsNumber ?? _goodsNumber,
  logs: logs ?? _logs,
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
  dynamic get createTime => _createTime;
  dynamic get updateTime => _updateTime;
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
  dynamic get hasId => _hasId;
  dynamic get goodsName => _goodsName;
  String? get nickname => _nickname;
  String? get headImg => _headImg;
  String? get statusDesc => _statusDesc;
  String? get statusInfo => _statusInfo;
  Good? get good => _good;
  String? get standard => _standard;
  String? get seriesName => _seriesName;
  String? get equityTypeDesc => _equityTypeDesc;
  int? get goodsNumber => _goodsNumber;
  List<Logs>? get logs => _logs;

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
    map['status_desc'] = _statusDesc;
    map['status_info'] = _statusInfo;
    if (_good != null) {
      map['good'] = _good?.toJson();
    }
    map['standard'] = _standard;
    map['series_name'] = _seriesName;
    map['equity_type_desc'] = _equityTypeDesc;
    map['goods_number'] = _goodsNumber;
    if (_logs != null) {
      map['logs'] = _logs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 8
/// member_id : 1
/// code : "rBEHM7"
/// create_time : "2022-03-29 09:18:26"
/// update_time : 1648516706
/// info : "挂售"
/// price : "500.00"
/// nickname : "44444"
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"

Logs logsFromJson(String str) => Logs.fromJson(json.decode(str));
String logsToJson(Logs data) => json.encode(data.toJson());
class Logs {
  Logs({
      int? id, 
      int? memberId, 
      String? code,
    dynamic createTime,
    dynamic updateTime,
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
  dynamic _createTime;
  dynamic _updateTime;
  String? _info;
  String? _price;
  String? _nickname;
  String? _headImg;
Logs copyWith({  int? id,
  int? memberId,
  String? code,
  dynamic createTime,
  dynamic updateTime,
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
  dynamic get createTime => _createTime;
  dynamic get updateTime => _updateTime;
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

/// id : 1
/// goods_name : "冰墩墩F1"
/// goods_image : "http://oos.ymhzf.com/16484604934976.jpeg"
/// price : "99.00"
/// series_id : 1
/// author_image : "http://oos.ymhzf.com/16484317809783.png"
/// author_name : "创作者名称"
/// start_time : 1648431936
/// limit_num : 10000
/// show_minutes : 10
/// issuer : "发行方名称"
/// purchase_info : "购买须知"
/// create_time : 1648431827
/// update_time : 1648513640
/// is_nft : 1
/// token_uri : "https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT"
/// total_num : 50000
/// author_info : "创作者简介"
/// issuer_image : "http://oos.ymhzf.com/16484317952741.png"
/// issuer_info : "发行方简介"
/// equity_type : 1
/// standard : "ERC721"
/// sale : 3
/// status : 2
/// three_d : "https://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj"

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
      dynamic createTime,
    dynamic updateTime,
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
      String? threeD,}){
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
  dynamic _createTime;
  dynamic _updateTime;
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
  dynamic createTime,
  dynamic updateTime,
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
  dynamic get createTime => _createTime;
  dynamic get updateTime => _updateTime;
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
    return map;
  }

}