import 'dart:convert';
/// id : 1
/// series_name : "冰墩墩系列"
/// create_time : "2022-03-28 09:37:25"
/// update_time : "2022-05-18 10:57:03"
/// cover : "http://oss.ytsz.vip/16528426176842.jpeg"
/// icon : "http://oss.ytsz.vip/16528426219257.png"
/// content : "冰墩墩系列简介"
/// is_home : 1
/// coll_num : 15233
/// sale_num : 514
/// price : 199.02
/// min : 1

HomeAlbumEntity homeAlbumEntityFromJson(String str) => HomeAlbumEntity.fromJson(json.decode(str));
String homeAlbumEntityToJson(HomeAlbumEntity data) => json.encode(data.toJson());
class HomeAlbumEntity {
  HomeAlbumEntity({
      int? id, 
      String? seriesName, 
      String? createTime, 
      String? updateTime, 
      String? cover, 
      String? icon, 
      String? content, 
      int? isHome, 
      int? collNum, 
      int? saleNum, 
      double? price, 
      int? min,}){
    _id = id;
    _seriesName = seriesName;
    _createTime = createTime;
    _updateTime = updateTime;
    _cover = cover;
    _icon = icon;
    _content = content;
    _isHome = isHome;
    _collNum = collNum;
    _saleNum = saleNum;
    _price = price;
    _min = min;
}

  HomeAlbumEntity.fromJson(dynamic json) {
    _id = json['id'];
    _seriesName = json['series_name'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _cover = json['cover'];
    _icon = json['icon'];
    _content = json['content'];
    _isHome = json['is_home'];
    _collNum = json['coll_num'];
    _saleNum = json['sale_num'];
    _price = json['price'];
    _min = json['min'];
  }
  int? _id;
  String? _seriesName;
  String? _createTime;
  String? _updateTime;
  String? _cover;
  String? _icon;
  String? _content;
  int? _isHome;
  int? _collNum;
  int? _saleNum;
  var _price;
  int? _min;
HomeAlbumEntity copyWith({  int? id,
  String? seriesName,
  String? createTime,
  String? updateTime,
  String? cover,
  String? icon,
  String? content,
  int? isHome,
  int? collNum,
  int? saleNum,
  double? price,
  int? min,
}) => HomeAlbumEntity(  id: id ?? _id,
  seriesName: seriesName ?? _seriesName,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  cover: cover ?? _cover,
  icon: icon ?? _icon,
  content: content ?? _content,
  isHome: isHome ?? _isHome,
  collNum: collNum ?? _collNum,
  saleNum: saleNum ?? _saleNum,
  price: price ?? _price,
  min: min ?? _min,
);
  int? get id => _id;
  String? get seriesName => _seriesName;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get cover => _cover;
  String? get icon => _icon;
  String? get content => _content;
  int? get isHome => _isHome;
  int? get collNum => _collNum;
  int? get saleNum => _saleNum;
  double? get price => _price;
  int? get min => _min;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['series_name'] = _seriesName;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['cover'] = _cover;
    map['icon'] = _icon;
    map['content'] = _content;
    map['is_home'] = _isHome;
    map['coll_num'] = _collNum;
    map['sale_num'] = _saleNum;
    map['price'] = _price;
    map['min'] = _min;
    return map;
  }

}