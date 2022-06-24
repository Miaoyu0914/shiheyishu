import 'dart:convert';
/// id : 8
/// image_path : "http://ych2.oss-cn-beijing.aliyuncs.com/16488859858649.jpg"
/// sort : 1
/// create_time : "2022-04-02 15:52:10"
/// update_time : "2022-04-02 15:53:06"
/// type : 1
/// url : ""

HomeBannerEntity homeBannerEntityFromJson(String str) => HomeBannerEntity.fromJson(json.decode(str));
String homeBannerEntityToJson(HomeBannerEntity data) => json.encode(data.toJson());
class HomeBannerEntity {
  HomeBannerEntity({
      int? id, 
      String? imagePath, 
      int? sort, 
      String? createTime, 
      String? updateTime, 
      int? type, 
      String? url,}){
    _id = id;
    _imagePath = imagePath;
    _sort = sort;
    _createTime = createTime;
    _updateTime = updateTime;
    _type = type;
    _url = url;
}

  HomeBannerEntity.fromJson(dynamic json) {
    _id = json['id'];
    _imagePath = json['image_path'];
    _sort = json['sort'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _type = json['type'];
    _url = json['url'];
  }
  int? _id;
  String? _imagePath;
  int? _sort;
  String? _createTime;
  String? _updateTime;
  int? _type;
  String? _url;
HomeBannerEntity copyWith({  int? id,
  String? imagePath,
  int? sort,
  String? createTime,
  String? updateTime,
  int? type,
  String? url,
}) => HomeBannerEntity(  id: id ?? _id,
  imagePath: imagePath ?? _imagePath,
  sort: sort ?? _sort,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  type: type ?? _type,
  url: url ?? _url,
);
  int? get id => _id;
  String? get imagePath => _imagePath;
  int? get sort => _sort;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  int? get type => _type;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image_path'] = _imagePath;
    map['sort'] = _sort;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }

}