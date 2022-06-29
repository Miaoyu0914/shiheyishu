import 'dart:convert';
/// id : 1
/// type : 1
/// title : "祝您体验愉快，开心"
/// image : ""
/// small_text : ""
/// content : "祝您体验愉快，开心"
/// create_time : "2022-01-24 11:26:58"
/// update_time : "2022-03-25 11:49:42"
/// url : ""
/// look : 50025
/// time : "很久前"

BoardDetailEntity boardDetailEntityFromJson(String str) => BoardDetailEntity.fromJson(json.decode(str));
String boardDetailEntityToJson(BoardDetailEntity data) => json.encode(data.toJson());
class BoardDetailEntity {
  BoardDetailEntity({
      int? id, 
      int? type, 
      String? title, 
      String? image, 
      String? smallText, 
      String? content, 
      String? createTime, 
      String? updateTime, 
      String? url, 
      int? look, 
      String? time,}){
    _id = id;
    _type = type;
    _title = title;
    _image = image;
    _smallText = smallText;
    _content = content;
    _createTime = createTime;
    _updateTime = updateTime;
    _url = url;
    _look = look;
    _time = time;
}

  BoardDetailEntity.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _title = json['title'];
    _image = json['image'];
    _smallText = json['small_text'];
    _content = json['content'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _url = json['url'];
    _look = json['look'];
    _time = json['time'];
  }
  int? _id;
  int? _type;
  String? _title;
  String? _image;
  String? _smallText;
  String? _content;
  String? _createTime;
  String? _updateTime;
  String? _url;
  int? _look;
  String? _time;
BoardDetailEntity copyWith({  int? id,
  int? type,
  String? title,
  String? image,
  String? smallText,
  String? content,
  String? createTime,
  String? updateTime,
  String? url,
  int? look,
  String? time,
}) => BoardDetailEntity(  id: id ?? _id,
  type: type ?? _type,
  title: title ?? _title,
  image: image ?? _image,
  smallText: smallText ?? _smallText,
  content: content ?? _content,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  url: url ?? _url,
  look: look ?? _look,
  time: time ?? _time,
);
  int? get id => _id;
  int? get type => _type;
  String? get title => _title;
  String? get image => _image;
  String? get smallText => _smallText;
  String? get content => _content;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get url => _url;
  int? get look => _look;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['title'] = _title;
    map['image'] = _image;
    map['small_text'] = _smallText;
    map['content'] = _content;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['url'] = _url;
    map['look'] = _look;
    map['time'] = _time;
    return map;
  }

}