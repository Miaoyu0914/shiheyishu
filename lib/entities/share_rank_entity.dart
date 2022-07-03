import 'dart:convert';
/// id : 1
/// nickname : "44444"
/// direct_num : 22
/// phone : "13666666661"
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"

ShareRankEntity shareRankEntityFromJson(String str) => ShareRankEntity.fromJson(json.decode(str));
String shareRankEntityToJson(ShareRankEntity data) => json.encode(data.toJson());
class ShareRankEntity {
  ShareRankEntity({
      int? id, 
      String? nickname, 
      int? directNum, 
      String? phone, 
      String? headImg,}){
    _id = id;
    _nickname = nickname;
    _directNum = directNum;
    _phone = phone;
    _headImg = headImg;
}

  ShareRankEntity.fromJson(dynamic json) {
    _id = json['id'];
    _nickname = json['nickname'];
    _directNum = json['direct_num'];
    _phone = json['phone'];
    _headImg = json['head_img'];
  }
  int? _id;
  String? _nickname;
  int? _directNum;
  String? _phone;
  String? _headImg;
ShareRankEntity copyWith({  int? id,
  String? nickname,
  int? directNum,
  String? phone,
  String? headImg,
}) => ShareRankEntity(  id: id ?? _id,
  nickname: nickname ?? _nickname,
  directNum: directNum ?? _directNum,
  phone: phone ?? _phone,
  headImg: headImg ?? _headImg,
);
  int? get id => _id;
  String? get nickname => _nickname;
  int? get directNum => _directNum;
  String? get phone => _phone;
  String? get headImg => _headImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['direct_num'] = _directNum;
    map['phone'] = _phone;
    map['head_img'] = _headImg;
    return map;
  }

}