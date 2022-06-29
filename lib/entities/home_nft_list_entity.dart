import 'dart:convert';
/// total : 7
/// per_page : 10
/// current_page : 1
/// last_page : 1
/// data : [{"id":7,"goods_name":"虎仔之下半身","goods_image":"http://oss.ytsz.vip/16527578438262.jpg","start_time":"2022-05-25 13:30:00","status":1,"price":"22.02","author_name":"1","author_image":"http://oss.ytsz.vip/16527578732466.png","issuer":"1","issuer_image":"http://oss.ytsz.vip/16527578807268.png","total_num":2022,"sale":0,"status_desc":"未开始"},{"id":6,"goods_name":"测试uu","goods_image":"http://oss.ytsz.vip/16527480415994.jpeg","start_time":"2022-05-17 09:10:55","status":2,"price":"1.00","author_name":"1","author_image":"http://oss.ytsz.vip/16527480486051.gif","issuer":"1111","issuer_image":"http://oss.ytsz.vip/16527480538498.gif","total_num":100,"sale":4,"status_desc":"进行中"},{"id":3,"goods_name":"冰墩墩F2","goods_image":"http://oss.ytsz.vip/16516390775760.png","start_time":"2022-05-10 09:17:32","status":2,"price":"99.00","author_name":"创作者名称","author_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237148984.jpeg","issuer":"发行方名称","issuer_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16487237226546.jpeg","total_num":3000,"sale":6,"status_desc":"进行中"},{"id":4,"goods_name":"冰墩墩F3","goods_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16488863576306.jpeg","start_time":"2022-05-10 09:13:33","status":2,"price":"11.00","author_name":"创作者名称","author_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16488863638629.png","issuer":"发行方名称","issuer_image":"http://ych2.oss-cn-beijing.aliyuncs.com/16488863688030.png","total_num":111,"sale":2,"status_desc":"进行中"},{"id":5,"goods_name":"神将","goods_image":"https://oss.ytsz.vip/16509400959262.jfif","start_time":"2022-05-10 09:30:35","status":2,"price":"99.00","author_name":"创作者名称","author_image":"https://oss.ytsz.vip/16509401254739.png","issuer":"发行方名称","issuer_image":"https://oss.ytsz.vip/16509401332131.png","total_num":4000,"sale":6,"status_desc":"进行中"},{"id":2,"goods_name":"雪容绒F1","goods_image":"http://oos.ymhzf.com/16484471277594.jpeg","start_time":"2022-05-09 19:45:00","status":2,"price":"1680.00","author_name":"创作者名称","author_image":"http://oos.ymhzf.com/16484471359962.jpeg","issuer":"发行方名称","issuer_image":"http://oos.ymhzf.com/16484473363934.jpeg","total_num":5000,"sale":1,"status_desc":"进行中"},{"id":1,"goods_name":"冰墩墩F1","goods_image":"http://oss.ytsz.vip/16516377977004.jpeg","start_time":"2022-05-09 19:13:39","status":2,"price":"66.00","author_name":"创作者名称","author_image":"http://ytsknft.oss-cn-hangzhou.aliyuncs.com/16493172991067.png","issuer":"发行方名称","issuer_image":"http://oos.ymhzf.com/16484317952741.png","total_num":10000,"sale":502,"status_desc":"进行中"}]

HomeNftListEntity homeNftListEntityFromJson(String str) => HomeNftListEntity.fromJson(json.decode(str));
String homeNftListEntityToJson(HomeNftListEntity data) => json.encode(data.toJson());
class HomeNftListEntity {
  HomeNftListEntity({
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

  HomeNftListEntity.fromJson(dynamic json) {
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
HomeNftListEntity copyWith({  int? total,
  int? perPage,
  int? currentPage,
  int? lastPage,
  List<Data>? data,
}) => HomeNftListEntity(  total: total ?? _total,
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

/// id : 7
/// goods_name : "虎仔之下半身"
/// goods_image : "http://oss.ytsz.vip/16527578438262.jpg"
/// start_time : "2022-05-25 13:30:00"
/// status : 1
/// price : "22.02"
/// author_name : "1"
/// author_image : "http://oss.ytsz.vip/16527578732466.png"
/// issuer : "1"
/// issuer_image : "http://oss.ytsz.vip/16527578807268.png"
/// total_num : 2022
/// sale : 0
/// status_desc : "未开始"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? goodsName, 
      String? goodsImage, 
      String? startTime, 
      int? status, 
      String? price, 
      String? authorName, 
      String? authorImage, 
      String? issuer, 
      String? issuerImage, 
      int? totalNum, 
      int? sale, 
      String? statusDesc,}){
    _id = id;
    _goodsName = goodsName;
    _goodsImage = goodsImage;
    _startTime = startTime;
    _status = status;
    _price = price;
    _authorName = authorName;
    _authorImage = authorImage;
    _issuer = issuer;
    _issuerImage = issuerImage;
    _totalNum = totalNum;
    _sale = sale;
    _statusDesc = statusDesc;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _goodsName = json['goods_name'];
    _goodsImage = json['goods_image'];
    _startTime = json['start_time'];
    _status = json['status'];
    _price = json['price'];
    _authorName = json['author_name'];
    _authorImage = json['author_image'];
    _issuer = json['issuer'];
    _issuerImage = json['issuer_image'];
    _totalNum = json['total_num'];
    _sale = json['sale'];
    _statusDesc = json['status_desc'];
  }
  int? _id;
  String? _goodsName;
  String? _goodsImage;
  String? _startTime;
  int? _status;
  String? _price;
  String? _authorName;
  String? _authorImage;
  String? _issuer;
  String? _issuerImage;
  int? _totalNum;
  int? _sale;
  String? _statusDesc;
Data copyWith({  int? id,
  String? goodsName,
  String? goodsImage,
  String? startTime,
  int? status,
  String? price,
  String? authorName,
  String? authorImage,
  String? issuer,
  String? issuerImage,
  int? totalNum,
  int? sale,
  String? statusDesc,
}) => Data(  id: id ?? _id,
  goodsName: goodsName ?? _goodsName,
  goodsImage: goodsImage ?? _goodsImage,
  startTime: startTime ?? _startTime,
  status: status ?? _status,
  price: price ?? _price,
  authorName: authorName ?? _authorName,
  authorImage: authorImage ?? _authorImage,
  issuer: issuer ?? _issuer,
  issuerImage: issuerImage ?? _issuerImage,
  totalNum: totalNum ?? _totalNum,
  sale: sale ?? _sale,
  statusDesc: statusDesc ?? _statusDesc,
);
  int? get id => _id;
  String? get goodsName => _goodsName;
  String? get goodsImage => _goodsImage;
  String? get startTime => _startTime;
  int? get status => _status;
  String? get price => _price;
  String? get authorName => _authorName;
  String? get authorImage => _authorImage;
  String? get issuer => _issuer;
  String? get issuerImage => _issuerImage;
  int? get totalNum => _totalNum;
  int? get sale => _sale;
  String? get statusDesc => _statusDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['goods_name'] = _goodsName;
    map['goods_image'] = _goodsImage;
    map['start_time'] = _startTime;
    map['status'] = _status;
    map['price'] = _price;
    map['author_name'] = _authorName;
    map['author_image'] = _authorImage;
    map['issuer'] = _issuer;
    map['issuer_image'] = _issuerImage;
    map['total_num'] = _totalNum;
    map['sale'] = _sale;
    map['status_desc'] = _statusDesc;
    return map;
  }

}