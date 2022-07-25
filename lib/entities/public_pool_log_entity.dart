import 'dart:convert';
/// total : 2
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":5,"create_time":"2022-07-21 10:55:00","update_time":0,"num":"1680.00","user_id":83869530,"nickname":"测试哈哈哈","type":1},{"id":6,"create_time":"2022-07-21 10:55:00","update_time":0,"num":"1680.00","user_id":83869530,"nickname":"测试哈哈哈","type":1}]

PublicPoolLogEntity publicPoolLogEntityFromJson(String str) => PublicPoolLogEntity.fromJson(json.decode(str));
String publicPoolLogEntityToJson(PublicPoolLogEntity data) => json.encode(data.toJson());
class PublicPoolLogEntity {
  PublicPoolLogEntity({
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

  PublicPoolLogEntity.fromJson(dynamic json) {
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
PublicPoolLogEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => PublicPoolLogEntity(  total: total ?? _total,
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

/// id : 5
/// create_time : "2022-07-21 10:55:00"
/// update_time : 0
/// num : "1680.00"
/// user_id : 83869530
/// nickname : "测试哈哈哈"
/// type : 1

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? createTime, 
      int? updateTime, 
      String? num, 
      int? userId, 
      String? nickname, 
      int? type,}){
    _id = id;
    _createTime = createTime;
    _updateTime = updateTime;
    _num = num;
    _userId = userId;
    _nickname = nickname;
    _type = type;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _num = json['num'];
    _userId = json['user_id'];
    _nickname = json['nickname'];
    _type = json['type'];
  }
  int? _id;
  String? _createTime;
  int? _updateTime;
  String? _num;
  int? _userId;
  String? _nickname;
  int? _type;
Data copyWith({  int? id,
  String? createTime,
  int? updateTime,
  String? num,
  int? userId,
  String? nickname,
  int? type,
}) => Data(  id: id ?? _id,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  num: num ?? _num,
  userId: userId ?? _userId,
  nickname: nickname ?? _nickname,
  type: type ?? _type,
);
  int? get id => _id;
  String? get createTime => _createTime;
  int? get updateTime => _updateTime;
  String? get num => _num;
  int? get userId => _userId;
  String? get nickname => _nickname;
  int? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['num'] = _num;
    map['user_id'] = _userId;
    map['nickname'] = _nickname;
    map['type'] = _type;
    return map;
  }

}