import 'dart:convert';
/// total : 3
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":1,"create_time":1658392633,"update_time":0,"news_id":2,"status":1,"content":"hhhhh","user_id":83869530,"nick_name":"测试哈哈哈","head_img":"https://oss.ytsz.vip/16499838471044.png"},{"id":2,"create_time":1658392633,"update_time":0,"news_id":2,"status":1,"content":"hhhhh","user_id":83869530,"nick_name":"测试哈哈哈","head_img":"https://oss.ytsz.vip/16499838471044.png"},{"id":6,"create_time":1658392633,"update_time":0,"news_id":2,"status":1,"content":"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈","user_id":83869530,"nick_name":"测试哈哈哈","head_img":"https://oss.ytsz.vip/16499838471044.png"}]

PublicCommentListEntity publicCommentListEntityFromJson(String str) => PublicCommentListEntity.fromJson(json.decode(str));
String publicCommentListEntityToJson(PublicCommentListEntity data) => json.encode(data.toJson());
class PublicCommentListEntity {
  PublicCommentListEntity({
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

  PublicCommentListEntity.fromJson(dynamic json) {
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
PublicCommentListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => PublicCommentListEntity(  total: total ?? _total,
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

/// id : 1
/// create_time : 1658392633
/// update_time : 0
/// news_id : 2
/// status : 1
/// content : "hhhhh"
/// user_id : 83869530
/// nick_name : "测试哈哈哈"
/// head_img : "https://oss.ytsz.vip/16499838471044.png"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      dynamic createTime,
    dynamic updateTime,
      int? newsId, 
      int? status, 
      String? content, 
      int? userId, 
      String? nickName, 
      String? headImg,}){
    _id = id;
    _createTime = createTime;
    _updateTime = updateTime;
    _newsId = newsId;
    _status = status;
    _content = content;
    _userId = userId;
    _nickName = nickName;
    _headImg = headImg;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _newsId = json['news_id'];
    _status = json['status'];
    _content = json['content'];
    _userId = json['user_id'];
    _nickName = json['nick_name'];
    _headImg = json['head_img'];
  }
  int? _id;
  dynamic _createTime;
  dynamic _updateTime;
  int? _newsId;
  int? _status;
  String? _content;
  int? _userId;
  String? _nickName;
  String? _headImg;
Data copyWith({  int? id,
  dynamic createTime,
  dynamic updateTime,
  int? newsId,
  int? status,
  String? content,
  int? userId,
  String? nickName,
  String? headImg,
}) => Data(  id: id ?? _id,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  newsId: newsId ?? _newsId,
  status: status ?? _status,
  content: content ?? _content,
  userId: userId ?? _userId,
  nickName: nickName ?? _nickName,
  headImg: headImg ?? _headImg,
);
  int? get id => _id;
  dynamic get createTime => _createTime;
  dynamic get updateTime => _updateTime;
  int? get newsId => _newsId;
  int? get status => _status;
  String? get content => _content;
  int? get userId => _userId;
  String? get nickName => _nickName;
  String? get headImg => _headImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['news_id'] = _newsId;
    map['status'] = _status;
    map['content'] = _content;
    map['user_id'] = _userId;
    map['nick_name'] = _nickName;
    map['head_img'] = _headImg;
    return map;
  }

}