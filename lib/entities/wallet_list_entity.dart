import 'dart:convert';
/// total : 95
/// per_page : 10
/// current_page : 1
/// last_page : 10
/// data : [{"id":227,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-1.00","from":2,"before":"100930.44","after":"100929.44","create_time":"2022-05-24 15:09:47","update_time":"2022-05-24 15:09:47","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":226,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-200.00","from":2,"before":"101130.44","after":"100930.44","create_time":"2022-05-24 15:01:37","update_time":"2022-05-24 15:01:37","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":225,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-200.00","from":2,"before":"101330.44","after":"101130.44","create_time":"2022-05-24 14:59:25","update_time":"2022-05-24 14:59:25","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":224,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-200.00","from":2,"before":"101530.44","after":"101330.44","create_time":"2022-05-24 14:59:09","update_time":"2022-05-24 14:59:09","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":223,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-200.00","from":2,"before":"101730.44","after":"101530.44","create_time":"2022-05-24 14:58:50","update_time":"2022-05-24 14:58:50","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":222,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-500.00","from":2,"before":"102230.44","after":"101730.44","create_time":"2022-05-24 14:52:46","update_time":"2022-05-24 14:52:46","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":221,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-500.00","from":2,"before":"102730.44","after":"102230.44","create_time":"2022-05-24 14:43:50","update_time":"2022-05-24 14:43:50","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":220,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-500.00","from":2,"before":"103230.44","after":"102730.44","create_time":"2022-05-24 14:43:03","update_time":"2022-05-24 14:43:03","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":219,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-1.00","from":2,"before":"103231.44","after":"103230.44","create_time":"2022-05-24 14:35:00","update_time":"2022-05-24 14:35:00","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"},{"id":218,"member_id":1,"phone":"13666666661","nickname":"44444","amount":"-1.00","from":2,"before":"103232.44","after":"103231.44","create_time":"2022-05-24 14:27:58","update_time":"2022-05-24 14:27:58","remark":"提现","sign":2,"balance_type":1,"from_desc":"提现","balance_type_desc":"余额钱包"}]

WalletListEntity walletListEntityFromJson(String str) => WalletListEntity.fromJson(json.decode(str));
String walletListEntityToJson(WalletListEntity data) => json.encode(data.toJson());
class WalletListEntity {
  WalletListEntity({
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

  WalletListEntity.fromJson(dynamic json) {
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
WalletListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => WalletListEntity(  total: total ?? _total,
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

/// id : 227
/// member_id : 1
/// phone : "13666666661"
/// nickname : "44444"
/// amount : "-1.00"
/// from : 2
/// before : "100930.44"
/// after : "100929.44"
/// create_time : "2022-05-24 15:09:47"
/// update_time : "2022-05-24 15:09:47"
/// remark : "提现"
/// sign : 2
/// balance_type : 1
/// from_desc : "提现"
/// balance_type_desc : "余额钱包"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? memberId, 
      String? phone, 
      String? nickname, 
      String? amount, 
      int? from, 
      String? before, 
      String? after, 
      String? createTime, 
      String? updateTime, 
      String? remark, 
      int? sign, 
      int? balanceType, 
      String? fromDesc, 
      String? balanceTypeDesc,}){
    _id = id;
    _memberId = memberId;
    _phone = phone;
    _nickname = nickname;
    _amount = amount;
    _from = from;
    _before = before;
    _after = after;
    _createTime = createTime;
    _updateTime = updateTime;
    _remark = remark;
    _sign = sign;
    _balanceType = balanceType;
    _fromDesc = fromDesc;
    _balanceTypeDesc = balanceTypeDesc;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _memberId = json['member_id'];
    _phone = json['phone'];
    _nickname = json['nickname'];
    _amount = json['amount'];
    _from = json['from'];
    _before = json['before'];
    _after = json['after'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _remark = json['remark'];
    _sign = json['sign'];
    _balanceType = json['balance_type'];
    _fromDesc = json['from_desc'];
    _balanceTypeDesc = json['balance_type_desc'];
  }
  int? _id;
  int? _memberId;
  String? _phone;
  String? _nickname;
  String? _amount;
  int? _from;
  String? _before;
  String? _after;
  String? _createTime;
  String? _updateTime;
  String? _remark;
  int? _sign;
  int? _balanceType;
  String? _fromDesc;
  String? _balanceTypeDesc;
Data copyWith({  int? id,
  int? memberId,
  String? phone,
  String? nickname,
  String? amount,
  int? from,
  String? before,
  String? after,
  String? createTime,
  String? updateTime,
  String? remark,
  int? sign,
  int? balanceType,
  String? fromDesc,
  String? balanceTypeDesc,
}) => Data(  id: id ?? _id,
  memberId: memberId ?? _memberId,
  phone: phone ?? _phone,
  nickname: nickname ?? _nickname,
  amount: amount ?? _amount,
  from: from ?? _from,
  before: before ?? _before,
  after: after ?? _after,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  remark: remark ?? _remark,
  sign: sign ?? _sign,
  balanceType: balanceType ?? _balanceType,
  fromDesc: fromDesc ?? _fromDesc,
  balanceTypeDesc: balanceTypeDesc ?? _balanceTypeDesc,
);
  int? get id => _id;
  int? get memberId => _memberId;
  String? get phone => _phone;
  String? get nickname => _nickname;
  String? get amount => _amount;
  int? get from => _from;
  String? get before => _before;
  String? get after => _after;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get remark => _remark;
  int? get sign => _sign;
  int? get balanceType => _balanceType;
  String? get fromDesc => _fromDesc;
  String? get balanceTypeDesc => _balanceTypeDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['member_id'] = _memberId;
    map['phone'] = _phone;
    map['nickname'] = _nickname;
    map['amount'] = _amount;
    map['from'] = _from;
    map['before'] = _before;
    map['after'] = _after;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['remark'] = _remark;
    map['sign'] = _sign;
    map['balance_type'] = _balanceType;
    map['from_desc'] = _fromDesc;
    map['balance_type_desc'] = _balanceTypeDesc;
    return map;
  }

}