import 'dart:convert';
/// id : 1
/// name : "盲盒1"
/// image : "http://oos.ymhzf.com/16484473892282.jpeg"
/// num : 49999
/// limit_num : 4999
/// sale : 33
/// price : "99.00"
/// create_time : "2022-03-28 14:04:10"
/// update_time : "2022-05-03 17:41:23"
/// author_name : "创作者名称"
/// author_image : "http://oos.ymhzf.com/16484474169204.jpeg"
/// author_info : "创作者简介"
/// issuer : "发行方名称"
/// issuer_image : "http://oos.ymhzf.com/16484474273986.jpeg"
/// issuer_info : "发行方简介"
/// content : "<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 11px; font-weight: 700; text-align: right; background-color: rgb(255, 255, 255);\">购买须知</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 11px; font-weight: 700; text-align: right; background-color: rgb(255, 255, 255);\">购买须知</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 11px; font-weight: 700; text-align: right; background-color: rgb(255, 255, 255);\">购买须知</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, Tahoma, Arial, sans-serif; font-size: 11px; font-weight: 700; text-align: right; background-color: rgb(255, 255, 255);\">购买须知</span></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p>"
/// status : 3
/// start_at : 1651544201
/// end_at : 1653012915
/// purchase_info : "购买须知"
/// is_home : 1
/// info : "盲盒介绍"
/// share_img : "http://ych2.oss-cn-beijing.aliyuncs.com/16487804444284.png"
/// three_d : "http://oss.ytsz.vip/16496824424238.gltf"
/// reg_start : 1651626339
/// reg_end : 1651799145

BlindBoxListEntity blindBoxListEntityFromJson(String str) => BlindBoxListEntity.fromJson(json.decode(str));
String blindBoxListEntityToJson(BlindBoxListEntity data) => json.encode(data.toJson());
class BlindBoxListEntity {
  BlindBoxListEntity({
      int? id, 
      String? name, 
      String? image, 
      int? num, 
      int? limitNum, 
      int? sale, 
      String? price, 
      String? createTime, 
      String? updateTime, 
      String? authorName, 
      String? authorImage, 
      String? authorInfo, 
      String? issuer, 
      String? issuerImage, 
      String? issuerInfo, 
      String? content, 
      int? status, 
      int? startAt, 
      int? endAt, 
      String? purchaseInfo, 
      int? isHome, 
      String? info, 
      String? shareImg, 
      String? threeD, 
      int? regStart, 
      int? regEnd,}){
    _id = id;
    _name = name;
    _image = image;
    _num = num;
    _limitNum = limitNum;
    _sale = sale;
    _price = price;
    _createTime = createTime;
    _updateTime = updateTime;
    _authorName = authorName;
    _authorImage = authorImage;
    _authorInfo = authorInfo;
    _issuer = issuer;
    _issuerImage = issuerImage;
    _issuerInfo = issuerInfo;
    _content = content;
    _status = status;
    _startAt = startAt;
    _endAt = endAt;
    _purchaseInfo = purchaseInfo;
    _isHome = isHome;
    _info = info;
    _shareImg = shareImg;
    _threeD = threeD;
    _regStart = regStart;
    _regEnd = regEnd;
}

  BlindBoxListEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _num = json['num'];
    _limitNum = json['limit_num'];
    _sale = json['sale'];
    _price = json['price'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _authorName = json['author_name'];
    _authorImage = json['author_image'];
    _authorInfo = json['author_info'];
    _issuer = json['issuer'];
    _issuerImage = json['issuer_image'];
    _issuerInfo = json['issuer_info'];
    _content = json['content'];
    _status = json['status'];
    _startAt = json['start_at'];
    _endAt = json['end_at'];
    _purchaseInfo = json['purchase_info'];
    _isHome = json['is_home'];
    _info = json['info'];
    _shareImg = json['share_img'];
    _threeD = json['three_d'];
    _regStart = json['reg_start'];
    _regEnd = json['reg_end'];
  }
  int? _id;
  String? _name;
  String? _image;
  int? _num;
  int? _limitNum;
  int? _sale;
  String? _price;
  String? _createTime;
  String? _updateTime;
  String? _authorName;
  String? _authorImage;
  String? _authorInfo;
  String? _issuer;
  String? _issuerImage;
  String? _issuerInfo;
  String? _content;
  int? _status;
  int? _startAt;
  int? _endAt;
  String? _purchaseInfo;
  int? _isHome;
  String? _info;
  String? _shareImg;
  String? _threeD;
  int? _regStart;
  int? _regEnd;
BlindBoxListEntity copyWith({  int? id,
  String? name,
  String? image,
  int? num,
  int? limitNum,
  int? sale,
  String? price,
  String? createTime,
  String? updateTime,
  String? authorName,
  String? authorImage,
  String? authorInfo,
  String? issuer,
  String? issuerImage,
  String? issuerInfo,
  String? content,
  int? status,
  int? startAt,
  int? endAt,
  String? purchaseInfo,
  int? isHome,
  String? info,
  String? shareImg,
  String? threeD,
  int? regStart,
  int? regEnd,
}) => BlindBoxListEntity(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  num: num ?? _num,
  limitNum: limitNum ?? _limitNum,
  sale: sale ?? _sale,
  price: price ?? _price,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  authorName: authorName ?? _authorName,
  authorImage: authorImage ?? _authorImage,
  authorInfo: authorInfo ?? _authorInfo,
  issuer: issuer ?? _issuer,
  issuerImage: issuerImage ?? _issuerImage,
  issuerInfo: issuerInfo ?? _issuerInfo,
  content: content ?? _content,
  status: status ?? _status,
  startAt: startAt ?? _startAt,
  endAt: endAt ?? _endAt,
  purchaseInfo: purchaseInfo ?? _purchaseInfo,
  isHome: isHome ?? _isHome,
  info: info ?? _info,
  shareImg: shareImg ?? _shareImg,
  threeD: threeD ?? _threeD,
  regStart: regStart ?? _regStart,
  regEnd: regEnd ?? _regEnd,
);
  int? get id => _id;
  String? get name => _name;
  String? get image => _image;
  int? get num => _num;
  int? get limitNum => _limitNum;
  int? get sale => _sale;
  String? get price => _price;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  String? get authorName => _authorName;
  String? get authorImage => _authorImage;
  String? get authorInfo => _authorInfo;
  String? get issuer => _issuer;
  String? get issuerImage => _issuerImage;
  String? get issuerInfo => _issuerInfo;
  String? get content => _content;
  int? get status => _status;
  int? get startAt => _startAt;
  int? get endAt => _endAt;
  String? get purchaseInfo => _purchaseInfo;
  int? get isHome => _isHome;
  String? get info => _info;
  String? get shareImg => _shareImg;
  String? get threeD => _threeD;
  int? get regStart => _regStart;
  int? get regEnd => _regEnd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['num'] = _num;
    map['limit_num'] = _limitNum;
    map['sale'] = _sale;
    map['price'] = _price;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['author_name'] = _authorName;
    map['author_image'] = _authorImage;
    map['author_info'] = _authorInfo;
    map['issuer'] = _issuer;
    map['issuer_image'] = _issuerImage;
    map['issuer_info'] = _issuerInfo;
    map['content'] = _content;
    map['status'] = _status;
    map['start_at'] = _startAt;
    map['end_at'] = _endAt;
    map['purchase_info'] = _purchaseInfo;
    map['is_home'] = _isHome;
    map['info'] = _info;
    map['share_img'] = _shareImg;
    map['three_d'] = _threeD;
    map['reg_start'] = _regStart;
    map['reg_end'] = _regEnd;
    return map;
  }

}