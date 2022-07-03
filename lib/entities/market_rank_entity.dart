import 'dart:convert';
/// id : 79359307
/// nickname : "426测试"
/// market_num : "10690.00"
/// phone : "15860901041"
/// head_img : "https://oss.ytsz.vip/16499838471044.png"

MarketRankEntity marketRankEntityFromJson(String str) => MarketRankEntity.fromJson(json.decode(str));
String marketRankEntityToJson(MarketRankEntity data) => json.encode(data.toJson());
class MarketRankEntity {
  MarketRankEntity({
      int? id, 
      String? nickname, 
      String? marketNum, 
      String? phone, 
      String? headImg,}){
    _id = id;
    _nickname = nickname;
    _marketNum = marketNum;
    _phone = phone;
    _headImg = headImg;
}

  MarketRankEntity.fromJson(dynamic json) {
    _id = json['id'];
    _nickname = json['nickname'];
    _marketNum = json['market_num'];
    _phone = json['phone'];
    _headImg = json['head_img'];
  }
  int? _id;
  String? _nickname;
  String? _marketNum;
  String? _phone;
  String? _headImg;
MarketRankEntity copyWith({  int? id,
  String? nickname,
  String? marketNum,
  String? phone,
  String? headImg,
}) => MarketRankEntity(  id: id ?? _id,
  nickname: nickname ?? _nickname,
  marketNum: marketNum ?? _marketNum,
  phone: phone ?? _phone,
  headImg: headImg ?? _headImg,
);
  int? get id => _id;
  String? get nickname => _nickname;
  String? get marketNum => _marketNum;
  String? get phone => _phone;
  String? get headImg => _headImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['market_num'] = _marketNum;
    map['phone'] = _phone;
    map['head_img'] = _headImg;
    return map;
  }

}