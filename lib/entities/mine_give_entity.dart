import 'dart:convert';
/// total : 3
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":19,"from_member_id":2,"from_phone":"13666666662","to_member_id":1,"to_phone":"13666666661","type":3,"num":1,"member_space_id":44,"create_time":"2022-04-02 14:37:50","update_time":"2022-04-02 14:37:50","dan_type":0,"from":2,"goods_name":"冰墩墩F1","goods_image":"http://oos.ymhzf.com/16484604934976.jpeg"}]

MineGiveEntity mineGiveEntityFromJson(String str) => MineGiveEntity.fromJson(json.decode(str));
String mineGiveEntityToJson(MineGiveEntity data) => json.encode(data.toJson());
class MineGiveEntity {
  MineGiveEntity({
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

  MineGiveEntity.fromJson(dynamic json) {
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
MineGiveEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => MineGiveEntity(  total: total ?? _total,
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

/// id : 19
/// from_member_id : 2
/// from_phone : "13666666662"
/// to_member_id : 1
/// to_phone : "13666666661"
/// type : 3
/// num : 1
/// member_space_id : 44
/// create_time : "2022-04-02 14:37:50"
/// update_time : "2022-04-02 14:37:50"
/// dan_type : 0
/// from : 2
/// goods_name : "冰墩墩F1"
/// goods_image : "http://oos.ymhzf.com/16484604934976.jpeg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? fromMemberId, 
      String? fromPhone, 
      int? toMemberId, 
      String? toPhone, 
      int? type, 
      int? num, 
      int? memberSpaceId, 
      String? createTime, 
      String? updateTime, 
      int? danType, 
      int? from, 
      String? goodsName, 
      String? goodsImage,}){
    _id = id;
    _fromMemberId = fromMemberId;
    _fromPhone = fromPhone;
    _toMemberId = toMemberId;
    _toPhone = toPhone;
    _type = type;
    _num = num;
    _memberSpaceId = memberSpaceId;
    _createTime = createTime;
    _updateTime = updateTime;
    _danType = danType;
    _from = from;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _fromMemberId = json['from_member_id'];
    _fromPhone = json['from_phone'];
    _toMemberId = json['to_member_id'];
    _toPhone = json['to_phone'];
    _type = json['type'];
    _num = json['num'];
    _memberSpaceId = json['member_space_id'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _danType = json['dan_type'];
    _from = json['from'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
  }
  int? _id;
  int? _fromMemberId;
  String? _fromPhone;
  int? _toMemberId;
  String? _toPhone;
  int? _type;
  int? _num;
  int? _memberSpaceId;
  String? _createTime;
  String? _updateTime;
  int? _danType;
  int? _from;
  String? _goodsName;
  String? _goodsImage;
Data copyWith({  int? id,
  int? fromMemberId,
  String? fromPhone,
  int? toMemberId,
  String? toPhone,
  int? type,
  int? num,
  int? memberSpaceId,
  String? createTime,
  String? updateTime,
  int? danType,
  int? from,
  String? goodsName,
  String? goodsImage,
}) => Data(  id: id ?? _id,
  fromMemberId: fromMemberId ?? _fromMemberId,
  fromPhone: fromPhone ?? _fromPhone,
  toMemberId: toMemberId ?? _toMemberId,
  toPhone: toPhone ?? _toPhone,
  type: type ?? _type,
  num: num ?? _num,
  memberSpaceId: memberSpaceId ?? _memberSpaceId,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  danType: danType ?? _danType,
  from: from ?? _from,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
);
  int? get id => _id;
  int? get fromMemberId => _fromMemberId;
  String? get fromPhone => _fromPhone;
  int? get toMemberId => _toMemberId;
  String? get toPhone => _toPhone;
  int? get type => _type;
  int? get num => _num;
  int? get memberSpaceId => _memberSpaceId;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  int? get danType => _danType;
  int? get from => _from;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['from_member_id'] = _fromMemberId;
    map['from_phone'] = _fromPhone;
    map['to_member_id'] = _toMemberId;
    map['to_phone'] = _toPhone;
    map['type'] = _type;
    map['num'] = _num;
    map['member_space_id'] = _memberSpaceId;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['dan_type'] = _danType;
    map['from'] = _from;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    return map;
  }

}