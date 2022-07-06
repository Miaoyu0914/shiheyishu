import 'dart:convert';
/// goods_id : 1
/// series_id : 0
/// goods_image : "http://oos.ymhzf.com/16484604934976.jpeg"
/// goods_name : "冰墩墩F1"
/// count : 5

MineGroupListEntity mineGroupListEntityFromJson(String str) => MineGroupListEntity.fromJson(json.decode(str));
String mineGroupListEntityToJson(MineGroupListEntity data) => json.encode(data.toJson());
class MineGroupListEntity {
  MineGroupListEntity({
      int? goodsId, 
      int? seriesId, 
      String? goodsImage, 
      String? goodsName, 
      int? count,}){
    _goodsId = goodsId;
    _seriesId = seriesId;
    _goodsImage = goodsImage;
    _goodsName = goodsName;
    _count = count;
}

  MineGroupListEntity.fromJson(dynamic json) {
    _goodsId = json['goods_id'];
    _seriesId = json['series_id'];
    _goodsImage = json['goods_image'];
    _goodsName = json['goods_name'];
    _count = json['count'];
  }
  int? _goodsId;
  int? _seriesId;
  String? _goodsImage;
  String? _goodsName;
  int? _count;
MineGroupListEntity copyWith({  int? goodsId,
  int? seriesId,
  String? goodsImage,
  String? goodsName,
  int? count,
}) => MineGroupListEntity(  goodsId: goodsId ?? _goodsId,
  seriesId: seriesId ?? _seriesId,
  goodsImage: goodsImage ?? _goodsImage,
  goodsName: goodsName ?? _goodsName,
  count: count ?? _count,
);
  int? get goodsId => _goodsId;
  int? get seriesId => _seriesId;
  String? get goodsImage => _goodsImage;
  String? get goodsName => _goodsName;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['goods_id'] = _goodsId;
    map['series_id'] = _seriesId;
    map['goods_image'] = _goodsImage;
    map['goods_name'] = _goodsName;
    map['count'] = _count;
    return map;
  }

}