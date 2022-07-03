import 'dart:convert';
/// id : 6
/// goods_name : "测试uu"
/// goods_image : "http://oss.ytsz.vip/16527480415994.jpeg"
/// start_time : "2022-05-17 09:10:55"
/// status : 2
/// price : "1.00"
/// author_name : "1"
/// author_image : "http://oss.ytsz.vip/16527480486051.gif"
/// issuer : "1111"
/// issuer_image : "http://oss.ytsz.vip/16527480538498.gif"
/// total_num : 100
/// sale : 4
/// status_desc : "进行中"

AlbumDetailListEntity albumDetailListEntityFromJson(String str) => AlbumDetailListEntity.fromJson(json.decode(str));
String albumDetailListEntityToJson(AlbumDetailListEntity data) => json.encode(data.toJson());
class AlbumDetailListEntity {
  AlbumDetailListEntity({
      int? id, 
      String? goodsName, 
      String? goodsImage, 
      String? startTime, 
      int? status, 
      String? price, 
      String? authorName, 
      String? authorImage, 
      String? issuer, 
      String? issuerImage, 
      int? totalNum, 
      int? sale, 
      String? statusDesc,}){
    _id = id;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
    _startTime = startTime;
    _status = status;
    _price = price;
    _authorName = authorName;
    _authorImage = authorImage;
    _issuer = issuer;
    _issuerImage = issuerImage;
    _totalNum = totalNum;
    _sale = sale;
    _statusDesc = statusDesc;
}

  AlbumDetailListEntity.fromJson(dynamic json) {
    _id = json['id'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
    _startTime = json['start_time'];
    _status = json['status'];
    _price = json['price'];
    _authorName = json['author_name'];
    _authorImage = json['author_image'];
    _issuer = json['issuer'];
    _issuerImage = json['issuer_image'];
    _totalNum = json['total_num'];
    _sale = json['sale'];
    _statusDesc = json['status_desc'];
  }
  int? _id;
  String? _goodsName;
  String? _goodsImage;
  String? _startTime;
  int? _status;
  String? _price;
  String? _authorName;
  String? _authorImage;
  String? _issuer;
  String? _issuerImage;
  int? _totalNum;
  int? _sale;
  String? _statusDesc;
AlbumDetailListEntity copyWith({  int? id,
  String? goodsName,
  String? goodsImage,
  String? startTime,
  int? status,
  String? price,
  String? authorName,
  String? authorImage,
  String? issuer,
  String? issuerImage,
  int? totalNum,
  int? sale,
  String? statusDesc,
}) => AlbumDetailListEntity(  id: id ?? _id,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
  startTime: startTime ?? _startTime,
  status: status ?? _status,
  price: price ?? _price,
  authorName: authorName ?? _authorName,
  authorImage: authorImage ?? _authorImage,
  issuer: issuer ?? _issuer,
  issuerImage: issuerImage ?? _issuerImage,
  totalNum: totalNum ?? _totalNum,
  sale: sale ?? _sale,
  statusDesc: statusDesc ?? _statusDesc,
);
  int? get id => _id;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get startTime => _startTime;
  int? get status => _status;
  String? get price => _price;
  String? get authorName => _authorName;
  String? get authorImage => _authorImage;
  String? get issuer => _issuer;
  String? get issuerImage => _issuerImage;
  int? get totalNum => _totalNum;
  int? get sale => _sale;
  String? get statusDesc => _statusDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    map['start_time'] = _startTime;
    map['status'] = _status;
    map['price'] = _price;
    map['author_name'] = _authorName;
    map['author_image'] = _authorImage;
    map['issuer'] = _issuer;
    map['issuer_image'] = _issuerImage;
    map['total_num'] = _totalNum;
    map['sale'] = _sale;
    map['status_desc'] = _statusDesc;
    return map;
  }

}