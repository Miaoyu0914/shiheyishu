import 'dart:convert';
/// total : 5
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":41,"member_id":1,"order_sn":"7202204021017329991","goods_number":6,"goods_id":1,"status":0,"create_time":"2022-04-02 10:17:46","update_time":"2022-04-02 10:17:46","from":3,"order_id":0,"rent_time":0,"compose_time":0,"exchange_code_id":0,"is_nft":1,"hash":"0x78ba1b978857ae63dc58a355b8f1e5df4f67f115c09a75d90756025979e890e4","token_id":40,"transfer_time":0,"snapshot":"a:24:{s:2:\"id\";i:1;s:12:\"blind_box_id\";i:1;s:10:\"goods_name\";s:10:\"盲盒冰1\";s:11:\"goods_image\";s:40:\"http://oos.ymhzf.com/16484479887450.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:4;s:12:\"author_image\";s:40:\"http://oos.ymhzf.com/16484480003185.jpeg\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1648448016;s:11:\"update_time\";i:1648538075;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT\";s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:40:\"http://oos.ymhzf.com/16484480105526.jpeg\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:8:\"standard\";s:6:\"ERC721\";s:11:\"probability\";s:2:\"50\";s:4:\"sale\";i:12;s:3:\"num\";i:5000;s:7:\"three_d\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16485380674230.gltf\";s:9:\"share_img\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png\";}","code":"bilotw","series_id":4,"blind_box_id":1,"goods_name":"盲盒冰1","auto":0,"series_name":"盲盒系列","cover":"http://oss.ytsz.vip/16528426325910.jpeg","icon":"http://oss.ytsz.vip/16528426369839.png"}]

MineAlbumListEntity mineAlbumListEntityFromJson(String str) => MineAlbumListEntity.fromJson(json.decode(str));
String mineAlbumListEntityToJson(MineAlbumListEntity data) => json.encode(data.toJson());
class MineAlbumListEntity {
  MineAlbumListEntity({
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

  MineAlbumListEntity.fromJson(dynamic json) {
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
MineAlbumListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => MineAlbumListEntity(  total: total ?? _total,
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

/// id : 41
/// member_id : 1
/// order_sn : "7202204021017329991"
/// goods_number : 6
/// goods_id : 1
/// status : 0
/// create_time : "2022-04-02 10:17:46"
/// update_time : "2022-04-02 10:17:46"
/// from : 3
/// order_id : 0
/// rent_time : 0
/// compose_time : 0
/// exchange_code_id : 0
/// is_nft : 1
/// hash : "0x78ba1b978857ae63dc58a355b8f1e5df4f67f115c09a75d90756025979e890e4"
/// token_id : 40
/// transfer_time : 0
/// snapshot : "a:24:{s:2:\"id\";i:1;s:12:\"blind_box_id\";i:1;s:10:\"goods_name\";s:10:\"盲盒冰1\";s:11:\"goods_image\";s:40:\"http://oos.ymhzf.com/16484479887450.jpeg\";s:5:\"price\";s:5:\"99.00\";s:9:\"series_id\";i:4;s:12:\"author_image\";s:40:\"http://oos.ymhzf.com/16484480003185.jpeg\";s:11:\"author_name\";s:15:\"创作者名称\";s:10:\"start_time\";i:0;s:6:\"issuer\";s:15:\"发行方名称\";s:13:\"purchase_info\";s:12:\"购买须知\";s:11:\"create_time\";i:1648448016;s:11:\"update_time\";i:1648538075;s:6:\"is_nft\";i:1;s:9:\"token_uri\";s:74:\"https://ipfs.infura.io/ipfs/QmaMi3NcMu5SE9Q2Ywazw8cxGFicZKiYiuK15EGwDf6dQT\";s:11:\"author_info\";s:15:\"创作者简介\";s:12:\"issuer_image\";s:40:\"http://oos.ymhzf.com/16484480105526.jpeg\";s:11:\"issuer_info\";s:15:\"发行方简介\";s:8:\"standard\";s:6:\"ERC721\";s:11:\"probability\";s:2:\"50\";s:4:\"sale\";i:12;s:3:\"num\";i:5000;s:7:\"three_d\";s:59:\"http://ych2.oss-cn-beijing.aliyuncs.com/16485380674230.gltf\";s:9:\"share_img\";s:58:\"http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png\";}"
/// code : "bilotw"
/// series_id : 4
/// blind_box_id : 1
/// goods_name : "盲盒冰1"
/// auto : 0
/// series_name : "盲盒系列"
/// cover : "http://oss.ytsz.vip/16528426325910.jpeg"
/// icon : "http://oss.ytsz.vip/16528426369839.png"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
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
      int? blindBoxId, 
      String? goodsName, 
      int? auto, 
      String? seriesName, 
      String? cover, 
      String? icon,}){
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
    _seriesName = seriesName;
    _cover = cover;
    _icon = icon;
}

  Data.fromJson(dynamic json) {
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
    _seriesName = json['series_name'];
    _cover = json['cover'];
    _icon = json['icon'];
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
  int? _blindBoxId;
  String? _goodsName;
  int? _auto;
  String? _seriesName;
  String? _cover;
  String? _icon;
Data copyWith({  int? id,
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
  int? blindBoxId,
  String? goodsName,
  int? auto,
  String? seriesName,
  String? cover,
  String? icon,
}) => Data(  id: id ?? _id,
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
  seriesName: seriesName ?? _seriesName,
  cover: cover ?? _cover,
  icon: icon ?? _icon,
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
  int? get blindBoxId => _blindBoxId;
  String? get goodsName => _goodsName;
  int? get auto => _auto;
  String? get seriesName => _seriesName;
  String? get cover => _cover;
  String? get icon => _icon;

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
    map['series_name'] = _seriesName;
    map['cover'] = _cover;
    map['icon'] = _icon;
    return map;
  }

}