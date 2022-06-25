import 'dart:convert';
/// total : 2
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"member_id":1,"id":13,"price":"1111.00","from":1,"goods_id":3,"rent_sn":"3202205071401040331","good_snapshot":"a:27:{s:2:\"id\";i:3;s:10:\"goods_name\";s:11:\"冰墩墩F2\";s:11:\"goods_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1648742400;s:9:\"limit_num\";i:5000;s:12:\"show_minutes\";i:10000;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:4:\"1111\";s:11:\"create_time\";i:1648723745;s:11:\"update_time\";i:1648723745;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT\";s:9:\"total_num\";i:1;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:1;s:6:\"status\";i:3;s:7:\"three_d\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237072467.gltf\";s:4:\"info\";s:12:\"作品介绍\";s:9:\"share_img\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png\";}","nickname":"44444","head_img":"https://oss.ytsz.vip/16508770768000.gif","good":{"id":3,"goods_name":"冰墩墩F2","goods_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg","price":"99.00","series_id":1,"author_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg","author_name":"创作者名称","start_time":1648742400,"limit_num":5000,"show_minutes":10000,"issuer":"发行方名称","purchase_info":"1111","create_time":1648723745,"update_time":1648723745,"is_nft":1,"token_uri":"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT","total_num":1,"author_info":"创作者简介","issuer_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg","issuer_info":"发行方简介","equity_type":1,"standard":"ERC721","sale":1,"status":3,"three_d":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237072467.gltf","info":"作品介绍","share_img":"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png"},"img":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg","good_name":"冰墩墩F2"},{"member_id":1,"id":2,"price":"500.00","from":1,"goods_id":1,"rent_sn":"3202203290918260692","good_snapshot":"a:25:{s:2:\"id\";i:1;s:10:\"goods_name\";s:11:\"冰墩墩F1\";s:11:\"goods_image\";s:40:\"http://oos.ymhzf.com/16484604934976.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:39:\"http://oos.ymhzf.com/16484317809783.png\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1648431936;s:9:\"limit_num\";i:10000;s:12:\"show_minutes\";i:10;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1648431827;s:11:\"update_time\";i:1648513640;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT\";s:9:\"total_num\";i:50000;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:39:\"http://oos.ymhzf.com/16484317952741.png\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:3;s:6:\"status\";i:2;s:7:\"three_d\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj\";}","nickname":"44444","head_img":"https://oss.ytsz.vip/16508770768000.gif","good":{"id":1,"goods_name":"冰墩墩F1","goods_image":"http://oos.ymhzf.com/16484604934976.jpeg","price":"99.00","series_id":1,"author_image":"http://oos.ymhzf.com/16484317809783.png","author_name":"创作者名称","start_time":1648431936,"limit_num":10000,"show_minutes":10,"issuer":"发行方名称","purchase_info":"购买须知","create_time":1648431827,"update_time":1648513640,"is_nft":1,"token_uri":"https://ipfs.infura.io/ipfs/QmSSYWjGrrmSN8XVP3tnCHKP3o5mnDcrXzGrz37H86vCcT","total_num":50000,"author_info":"创作者简介","issuer_image":"http://oos.ymhzf.com/16484317952741.png","issuer_info":"发行方简介","equity_type":1,"standard":"ERC721","sale":3,"status":2,"three_d":"http://ych2.oss-cn-beijing.aliyuncs.com/16485136357536.obj"},"img":"http://oos.ymhzf.com/16484604934976.jpeg","good_name":"冰墩墩F1"}]

MarketNftListEntity marketNftListEntityFromJson(String str) => MarketNftListEntity.fromJson(json.decode(str));
String marketNftListEntityToJson(MarketNftListEntity data) => json.encode(data.toJson());
class MarketNftListEntity {
  MarketNftListEntity({
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

  MarketNftListEntity.fromJson(dynamic json) {
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
MarketNftListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => MarketNftListEntity(  total: total ?? _total,
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

/// member_id : 1
/// id : 13
/// price : "1111.00"
/// from : 1
/// goods_id : 3
/// rent_sn : "3202205071401040331"
/// good_snapshot : "a:27:{s:2:\"id\";i:3;s:10:\"goods_name\";s:11:\"冰墩墩F2\";s:11:\"goods_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:1;s:12:\"author_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:1648742400;s:9:\"limit_num\";i:5000;s:12:\"show_minutes\";i:10000;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:4:\"1111\";s:11:\"create_time\";i:1648723745;s:11:\"update_time\";i:1648723745;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT\";s:9:\"total_num\";i:1;s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:11:\"equity_type\";i:1;s:8:\"standard\";s:6:\"ERC721\";s:4:\"sale\";i:1;s:6:\"status\";i:3;s:7:\"three_d\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487237072467.gltf\";s:4:\"info\";s:12:\"作品介绍\";s:9:\"share_img\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png\";}"
/// nickname : "44444"
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"
/// good : {"id":3,"goods_name":"冰墩墩F2","goods_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg","price":"99.00","series_id":1,"author_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg","author_name":"创作者名称","start_time":1648742400,"limit_num":5000,"show_minutes":10000,"issuer":"发行方名称","purchase_info":"1111","create_time":1648723745,"update_time":1648723745,"is_nft":1,"token_uri":"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT","total_num":1,"author_info":"创作者简介","issuer_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg","issuer_info":"发行方简介","equity_type":1,"standard":"ERC721","sale":1,"status":3,"three_d":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237072467.gltf","info":"作品介绍","share_img":"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png"}
/// img : "http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg"
/// good_name : "冰墩墩F2"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? memberId, 
      int? id, 
      String? price, 
      int? from, 
      int? goodsId, 
      String? rentSn, 
      String? goodSnapshot, 
      String? nickname, 
      String? headImg, 
      Good? good, 
      String? img, 
      String? goodName,}){
    _memberId = memberId;
    _id = id;
    _price = price;
    _from = from;
    _goodsId = goodsId;
    _rentSn = rentSn;
    _goodSnapshot = goodSnapshot;
    _nickname = nickname;
    _headImg = headImg;
    _good = good;
    _img = img;
    _goodName = goodName;
}

  Data.fromJson(dynamic json) {
    _memberId = json['member_id'];
    _id = json['id'];
    _price = json['price'];
    _from = json['from'];
    _goodsId = json['goods_id'];
    _rentSn = json['rent_sn'];
    _goodSnapshot = json['good_snapshot'];
    _nickname = json['nickname'];
    _headImg = json['head_img'];
    _good = json['good'] != null ? Good.fromJson(json['good']) : null;
    _img = json['img'];
    _goodName = json['good_name'];
  }
  int? _memberId;
  int? _id;
  String? _price;
  int? _from;
  int? _goodsId;
  String? _rentSn;
  String? _goodSnapshot;
  String? _nickname;
  String? _headImg;
  Good? _good;
  String? _img;
  String? _goodName;
Data copyWith({  int? memberId,
  int? id,
  String? price,
  int? from,
  int? goodsId,
  String? rentSn,
  String? goodSnapshot,
  String? nickname,
  String? headImg,
  Good? good,
  String? img,
  String? goodName,
}) => Data(  memberId: memberId ?? _memberId,
  id: id ?? _id,
  price: price ?? _price,
  from: from ?? _from,
  goodsId: goodsId ?? _goodsId,
  rentSn: rentSn ?? _rentSn,
  goodSnapshot: goodSnapshot ?? _goodSnapshot,
  nickname: nickname ?? _nickname,
  headImg: headImg ?? _headImg,
  good: good ?? _good,
  img: img ?? _img,
  goodName: goodName ?? _goodName,
);
  int? get memberId => _memberId;
  int? get id => _id;
  String? get price => _price;
  int? get from => _from;
  int? get goodsId => _goodsId;
  String? get rentSn => _rentSn;
  String? get goodSnapshot => _goodSnapshot;
  String? get nickname => _nickname;
  String? get headImg => _headImg;
  Good? get good => _good;
  String? get img => _img;
  String? get goodName => _goodName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['member_id'] = _memberId;
    map['id'] = _id;
    map['price'] = _price;
    map['from'] = _from;
    map['goods_id'] = _goodsId;
    map['rent_sn'] = _rentSn;
    map['good_snapshot'] = _goodSnapshot;
    map['nickname'] = _nickname;
    map['head_img'] = _headImg;
    if (_good != null) {
      map['good'] = _good?.toJson();
    }
    map['img'] = _img;
    map['good_name'] = _goodName;
    return map;
  }

}

/// id : 3
/// goods_name : "冰墩墩F2"
/// goods_image : "http://ych2.oss-cn-beijing.aliyuncs.com/16487237006376.jpeg"
/// price : "99.00"
/// series_id : 1
/// author_image : "http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg"
/// author_name : "创作者名称"
/// start_time : 1648742400
/// limit_num : 5000
/// show_minutes : 10000
/// issuer : "发行方名称"
/// purchase_info : "1111"
/// create_time : 1648723745
/// update_time : 1648723745
/// is_nft : 1
/// token_uri : "https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT"
/// total_num : 1
/// author_info : "创作者简介"
/// issuer_image : "http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg"
/// issuer_info : "发行方简介"
/// equity_type : 1
/// standard : "ERC721"
/// sale : 1
/// status : 3
/// three_d : "http://ych2.oss-cn-beijing.aliyuncs.com/16487237072467.gltf"
/// info : "作品介绍"
/// share_img : "http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png"

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
      String? shareImg,}){
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
    return map;
  }

}