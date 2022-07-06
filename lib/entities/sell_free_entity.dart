import 'dart:convert';
/// pay_fee : "5.00"
/// service_fee : "5.00"
/// copyright_fee : "5.00"

SellFreeEntity sellFreeEntityFromJson(String str) => SellFreeEntity.fromJson(json.decode(str));
String sellFreeEntityToJson(SellFreeEntity data) => json.encode(data.toJson());
class SellFreeEntity {
  SellFreeEntity({
      String? payFee, 
      String? serviceFee, 
      String? copyrightFee,}){
    _payFee = payFee;
    _serviceFee = serviceFee;
    _copyrightFee = copyrightFee;
}

  SellFreeEntity.fromJson(dynamic json) {
    _payFee = json['pay_fee'];
    _serviceFee = json['service_fee'];
    _copyrightFee = json['copyright_fee'];
  }
  String? _payFee;
  String? _serviceFee;
  String? _copyrightFee;
SellFreeEntity copyWith({  String? payFee,
  String? serviceFee,
  String? copyrightFee,
}) => SellFreeEntity(  payFee: payFee ?? _payFee,
  serviceFee: serviceFee ?? _serviceFee,
  copyrightFee: copyrightFee ?? _copyrightFee,
);
  String? get payFee => _payFee;
  String? get serviceFee => _serviceFee;
  String? get copyrightFee => _copyrightFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pay_fee'] = _payFee;
    map['service_fee'] = _serviceFee;
    map['copyright_fee'] = _copyrightFee;
    return map;
  }

}