import 'dart:convert';
/// id : 2
/// create_time : "2022-07-22 15:05:46"
/// update_time : "2022-07-21 15:09:19"
/// title : "哈哈哈哈哈"
/// img : "http://oss.ytsz.vip/16583871415139.jpg"
/// content : "<p><label class=\"control-label qg-control-label\" style=\"box-sizing: border-box; display: inline-block; max-width: 100%; margin-bottom: 0px; font-weight: 700; height: 34px; line-height: 34px; padding-top: 7px;\">内容</label></p><p>自定义标题</p><p>段落</p><p>arial</p><p>16px</p><p><label class=\"control-label qg-control-label\" style=\"box-sizing: border-box; display: inline-block; max-width: 100%; margin-bottom: 0px; font-weight: 700; height: 34px; line-height: 34px; padding-top: 7px;\">内容</label></p><p>自定义标题</p><p>段落</p><p>arial</p><p>16px</p><p><label class=\"control-label qg-control-label\" style=\"box-sizing: border-box; display: inline-block; max-width: 100%; margin-bottom: 0px; font-weight: 700; height: 34px; line-height: 34px; padding-top: 7px;\">内容</label></p><p>自定义标题</p><p>段落</p><p>arial</p><p>16px</p><p><br/></p><p></p>"

PublicArticleDetailEntity publicArticleDetailEntityFromJson(String str) => PublicArticleDetailEntity.fromJson(json.decode(str));
String publicArticleDetailEntityToJson(PublicArticleDetailEntity data) => json.encode(data.toJson());
class PublicArticleDetailEntity {
  PublicArticleDetailEntity({
      int? id, 
      String? createTime, 
      String? updateTime, 
      String? title, 
      String? img, 
      String? content,}){
    _id = id;
    _createTime = createTime;
    _updateTime = updateTime;
    _title = title;
    _img = img;
    _content = content;
}

  PublicArticleDetailEntity.fromJson(dynamic json) {
    _id = json['id'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _title = json['title'];
    _img = json['img'];
    _content = json['content'];
  }
  int? _id;
  String? _createTime;
  String? _updateTime;
  String? _title;
  String? _img;
  String? _content;
PublicArticleDetailEntity copyWith({  int? id,
  String? createTime,
  String? updateTime,
  String? title,
  String? img,
  String? content,
}) => PublicArticleDetailEntity(  id: id ?? _id,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  title: title ?? _title,
  img: img ?? _img,
  content: content ?? _content,
);
  int? get id => _id;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get title => _title;
  String? get img => _img;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['title'] = _title;
    map['img'] = _img;
    map['content'] = _content;
    return map;
  }

}