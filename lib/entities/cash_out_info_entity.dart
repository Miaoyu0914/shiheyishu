import 'dart:convert';
/// min : "1"
/// fee : "50"
/// info : "提现说明"
/// balance : "100929.44"

CashOutInfoEntity cashOutInfoEntityFromJson(String str) => CashOutInfoEntity.fromJson(json.decode(str));
String cashOutInfoEntityToJson(CashOutInfoEntity data) => json.encode(data.toJson());
class CashOutInfoEntity {
  CashOutInfoEntity({
      String? min, 
      String? fee, 
      String? info, 
      String? balance,}){
    _min = min;
    _fee = fee;
    _info = info;
    _balance = balance;
}

  CashOutInfoEntity.fromJson(dynamic json) {
    _min = json['min'];
    _fee = json['fee'];
    _info = json['info'];
    _balance = json['balance'];
  }
  String? _min;
  String? _fee;
  String? _info;
  String? _balance;
CashOutInfoEntity copyWith({  String? min,
  String? fee,
  String? info,
  String? balance,
}) => CashOutInfoEntity(  min: min ?? _min,
  fee: fee ?? _fee,
  info: info ?? _info,
  balance: balance ?? _balance,
);
  String? get min => _min;
  String? get fee => _fee;
  String? get info => _info;
  String? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = _min;
    map['fee'] = _fee;
    map['info'] = _info;
    map['balance'] = _balance;
    return map;
  }

}