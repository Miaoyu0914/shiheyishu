import 'dart:convert';
/// id : 7
/// goods_name : "虎仔之下半身"
/// goods_image : "http://oss.ytsz.vip/16527578438262.jpg"
/// start_time : "2022-05-25 13:30:00"
/// status : 1
/// price : "22.02"
/// author_name : "1"
/// author_image : "http://oss.ytsz.vip/16527578732466.png"
/// issuer : "1"
/// issuer_image : "http://oss.ytsz.vip/16527578807268.png"
/// total_num : 2022
/// sale : 0
/// status_desc : "未开始"

HomeNftEntity homeNftEntityFromJson(String str) => HomeNftEntity.fromJson(json.decode(str));
String homeNftEntityToJson(HomeNftEntity data) => json.encode(data.toJson());
class HomeNftEntity {
  HomeNftEntity({
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

  HomeNftEntity.fromJson(dynamic json) {
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
HomeNftEntity copyWith({  int? id,
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
}) => HomeNftEntity(  id: id ?? _id,
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