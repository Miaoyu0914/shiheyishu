import 'dart:convert';
/// total : 2
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":2,"type":1,"title":"下单","image":"","small_text":"","content":"下单","create_time":"2022-03-29 14:05:37","update_time":"2022-03-29 14:05:37","url":"","look":51,"time":"2个月前","is_read":1},{"id":1,"type":1,"title":"祝您体验愉快，开心","image":"","small_text":"","content":"祝您体验愉快，开心","create_time":"2022-01-24 11:26:58","update_time":"2022-03-25 11:49:42","url":"","look":"5.0025万","time":"很久前","is_read":1}]

BoardListEntity boardListEntityFromJson(String str) => BoardListEntity.fromJson(json.decode(str));
String boardListEntityToJson(BoardListEntity data) => json.encode(data.toJson());
class BoardListEntity {
  BoardListEntity({
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

  BoardListEntity.fromJson(dynamic json) {
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
BoardListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => BoardListEntity(  total: total ?? _total,
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

/// id : 2
/// type : 1
/// title : "下单"
/// image : ""
/// small_text : ""
/// content : "下单"
/// create_time : "2022-03-29 14:05:37"
/// update_time : "2022-03-29 14:05:37"
/// url : ""
/// look : 51
/// time : "2个月前"
/// is_read : 1

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
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
      String? time, 
      int? isRead,}){
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
    _isRead = isRead;
}

  Data.fromJson(dynamic json) {
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
    _isRead = json['is_read'];
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
  // ignore: prefer_typing_uninitialized_variables
  var _look;
  String? _time;
  int? _isRead;
Data copyWith({  int? id,
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
  int? isRead,
}) => Data(  id: id ?? _id,
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
  isRead: isRead ?? _isRead,
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
  int? get isRead => _isRead;

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
    map['is_read'] = _isRead;
    return map;
  }

}