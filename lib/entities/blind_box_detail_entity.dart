import 'dart:convert';
/// id : 5
/// name : "测试1"
/// image : "http://oss.ytsz.vip/16515860804295.png"
/// num : 5000
/// limit_num : 20
/// sale : 33
/// price : "0.01"
/// create_time : "2022-05-03 21:56:36"
/// update_time : "2022-05-04 09:35:17"
/// author_name : "111"
/// author_image : "http://oss.ytsz.vip/16515861597726.png"
/// author_info : "111111"
/// issuer : "111"
/// issuer_image : "http://oss.ytsz.vip/16515861657655.png"
/// issuer_info : "111"
/// content : "<p>111</p><p></p><p></p><p></p><p></p><p></p>"
/// status : 2
/// start_at : 1633190400
/// end_at : 1653699169
/// purchase_info : "111"
/// is_home : 1
/// info : "1111"
/// share_img : "http://oss.ytsz.vip/16515861921218.png"
/// three_d : "http://oss.ytsz.vip/16515861172769.gltf"
/// reg_start : 15638400
/// reg_end : 1651625647
/// goods_list : [{"goods_name":"虎身","probability":"10.000","goods_image":"http://oss.ytsz.vip/16515837194878.jpg","price":"0.01"},{"goods_name":"虎棒子","probability":"39.990","goods_image":"http://oss.ytsz.vip/16516390359149.jpg","price":"0.01"},{"goods_name":"虎项链","probability":"19.990","goods_image":"http://oss.ytsz.vip/16515841784731.jpg","price":"0.01"},{"goods_name":"虎帽","probability":"29.990","goods_image":"http://oss.ytsz.vip/16515843089954.jpg","price":"0.01"},{"goods_name":"金","probability":"0.020","goods_image":"http://oss.ytsz.vip/16515844405488.jpg","price":"0.01"},{"goods_name":"银","probability":"0.010","goods_image":"http://oss.ytsz.vip/16515845347540.jpg","price":"0.01"}]
/// order_list_arr : [{"img":"虎身","name":"10.000","time":"http://oss.ytsz.vip/16515837194878.jpg","good_desc":""}]

BlindBoxDetailEntity blindBoxDetailEntityFromJson(String str) => BlindBoxDetailEntity.fromJson(json.decode(str));
String blindBoxDetailEntityToJson(BlindBoxDetailEntity data) => json.encode(data.toJson());
class BlindBoxDetailEntity {
  BlindBoxDetailEntity({
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
      int? regEnd, 
      List<GoodsList>? goodsList, 
      List<OrderListArr>? orderListArr,}){
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
    _goodsList = goodsList;
    _orderListArr = orderListArr;
}

  BlindBoxDetailEntity.fromJson(dynamic json) {
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
    if (json['goods_list'] != null) {
      _goodsList = [];
      json['goods_list'].forEach((v) {
        _goodsList?.add(GoodsList.fromJson(v));
      });
    }
    if (json['order_list_arr'] != null) {
      _orderListArr = [];
      json['order_list_arr'].forEach((v) {
        _orderListArr?.add(OrderListArr.fromJson(v));
      });
    }
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
  List<GoodsList>? _goodsList;
  List<OrderListArr>? _orderListArr;
BlindBoxDetailEntity copyWith({  int? id,
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
  List<GoodsList>? goodsList,
  List<OrderListArr>? orderListArr,
}) => BlindBoxDetailEntity(  id: id ?? _id,
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
  goodsList: goodsList ?? _goodsList,
  orderListArr: orderListArr ?? _orderListArr,
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
  List<GoodsList>? get goodsList => _goodsList;
  List<OrderListArr>? get orderListArr => _orderListArr;

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
    if (_goodsList != null) {
      map['goods_list'] = _goodsList?.map((v) => v.toJson()).toList();
    }
    if (_orderListArr != null) {
      map['order_list_arr'] = _orderListArr?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// img : "虎身"
/// name : "10.000"
/// time : "http://oss.ytsz.vip/16515837194878.jpg"
/// good_desc : ""

OrderListArr orderListArrFromJson(String str) => OrderListArr.fromJson(json.decode(str));
String orderListArrToJson(OrderListArr data) => json.encode(data.toJson());
class OrderListArr {
  OrderListArr({
      String? img, 
      String? name, 
      String? time, 
      String? goodDesc,}){
    _img = img;
    _name = name;
    _time = time;
    _goodDesc = goodDesc;
}

  OrderListArr.fromJson(dynamic json) {
    _img = json['img'];
    _name = json['name'];
    _time = json['time'];
    _goodDesc = json['good_desc'];
  }
  String? _img;
  String? _name;
  String? _time;
  String? _goodDesc;
OrderListArr copyWith({  String? img,
  String? name,
  String? time,
  String? goodDesc,
}) => OrderListArr(  img: img ?? _img,
  name: name ?? _name,
  time: time ?? _time,
  goodDesc: goodDesc ?? _goodDesc,
);
  String? get img => _img;
  String? get name => _name;
  String? get time => _time;
  String? get goodDesc => _goodDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = _img;
    map['name'] = _name;
    map['time'] = _time;
    map['good_desc'] = _goodDesc;
    return map;
  }

}

/// goods_name : "虎身"
/// probability : "10.000"
/// goods_image : "http://oss.ytsz.vip/16515837194878.jpg"
/// price : "0.01"

GoodsList goodsListFromJson(String str) => GoodsList.fromJson(json.decode(str));
String goodsListToJson(GoodsList data) => json.encode(data.toJson());
class GoodsList {
  GoodsList({
      String? goodsName, 
      String? probability, 
      String? goodsImage, 
      String? price,}){
    _goodsName = goodsName;
    _probability = probability;
    _goodsImage = goodsImage;
    _price = price;
}

  GoodsList.fromJson(dynamic json) {
    _goodsName = json['goods_name'];
    _probability = json['probability'];
    _goodsImage = json['goods_image'];
    _price = json['price'];
  }
  String? _goodsName;
  String? _probability;
  String? _goodsImage;
  String? _price;
GoodsList copyWith({  String? goodsName,
  String? probability,
  String? goodsImage,
  String? price,
}) => GoodsList(  goodsName: goodsName ?? _goodsName,
  probability: probability ?? _probability,
  goodsImage: goodsImage ?? _goodsImage,
  price: price ?? _price,
);
  String? get goodsName => _goodsName;
  String? get probability => _probability;
  String? get goodsImage => _goodsImage;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['goods_name'] = _goodsName;
    map['probability'] = _probability;
    map['goods_image'] = _goodsImage;
    map['price'] = _price;
    return map;
  }

}