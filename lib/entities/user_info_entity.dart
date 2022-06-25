import 'dart:convert';
/// id : 1
/// phone : "13666666661"
/// nickname : "44444"
/// pid : 0
/// node_level : 0
/// node_path : "0"
/// invite_code : "dfgx13"
/// create_time : "2022-03-23 15:07:48"
/// update_time : "2022-05-10 08:37:08"
/// status : 1
/// head_img : "https://oss.ytsz.vip/16508770768000.gif"
/// is_real : 1
/// level_id : 0
/// balance : "100929.44"
/// eth_address : "0x4cbA4160250eFDCF4BcBBc77CF13865bDB4d27Ee"
/// openid : ""
/// wx_nickname : ""
/// wx_name : "111s"
/// wx_account : "111"
/// ali_name : "闫春浩"
/// ali_account : "13664761954"
/// rand : "567348"
/// bao : "5832.66"
/// direct_num : 19
/// bank_name : null
/// bank_account : null
/// bank : null
/// ip : null
/// market_num : null

UserInfoEntity userInfoEntityFromJson(String str) => UserInfoEntity.fromJson(json.decode(str));
String userInfoEntityToJson(UserInfoEntity data) => json.encode(data.toJson());
class UserInfoEntity {
  UserInfoEntity({
      int? id, 
      String? phone, 
      String? nickname, 
      int? pid, 
      int? nodeLevel, 
      String? nodePath, 
      String? inviteCode, 
      String? createTime, 
      String? updateTime, 
      int? status, 
      String? headImg, 
      int? isReal, 
      int? levelId, 
      String? balance, 
      String? ethAddress, 
      String? openid, 
      String? wxNickname, 
      String? wxName, 
      String? wxAccount, 
      String? aliName, 
      String? aliAccount, 
      String? rand, 
      String? bao, 
      int? directNum, 
      dynamic bankName, 
      dynamic bankAccount, 
      dynamic bank, 
      dynamic ip, 
      dynamic marketNum,}){
    _id = id;
    _phone = phone;
    _nickname = nickname;
    _pid = pid;
    _nodeLevel = nodeLevel;
    _nodePath = nodePath;
    _inviteCode = inviteCode;
    _createTime = createTime;
    _updateTime = updateTime;
    _status = status;
    _headImg = headImg;
    _isReal = isReal;
    _levelId = levelId;
    _balance = balance;
    _ethAddress = ethAddress;
    _openid = openid;
    _wxNickname = wxNickname;
    _wxName = wxName;
    _wxAccount = wxAccount;
    _aliName = aliName;
    _aliAccount = aliAccount;
    _rand = rand;
    _bao = bao;
    _directNum = directNum;
    _bankName = bankName;
    _bankAccount = bankAccount;
    _bank = bank;
    _ip = ip;
    _marketNum = marketNum;
}

  UserInfoEntity.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _nickname = json['nickname'];
    _pid = json['pid'];
    _nodeLevel = json['node_level'];
    _nodePath = json['node_path'];
    _inviteCode = json['invite_code'];
    _createTime = json['create_time'];
    _updateTime = json['update_time'];
    _status = json['status'];
    _headImg = json['head_img'];
    _isReal = json['is_real'];
    _levelId = json['level_id'];
    _balance = json['balance'];
    _ethAddress = json['eth_address'];
    _openid = json['openid'];
    _wxNickname = json['wx_nickname'];
    _wxName = json['wx_name'];
    _wxAccount = json['wx_account'];
    _aliName = json['ali_name'];
    _aliAccount = json['ali_account'];
    _rand = json['rand'];
    _bao = json['bao'];
    _directNum = json['direct_num'];
    _bankName = json['bank_name'];
    _bankAccount = json['bank_account'];
    _bank = json['bank'];
    _ip = json['ip'];
    _marketNum = json['market_num'];
  }
  int? _id;
  String? _phone;
  String? _nickname;
  int? _pid;
  int? _nodeLevel;
  String? _nodePath;
  String? _inviteCode;
  String? _createTime;
  String? _updateTime;
  int? _status;
  String? _headImg;
  int? _isReal;
  int? _levelId;
  String? _balance;
  String? _ethAddress;
  String? _openid;
  String? _wxNickname;
  String? _wxName;
  String? _wxAccount;
  String? _aliName;
  String? _aliAccount;
  String? _rand;
  String? _bao;
  int? _directNum;
  dynamic _bankName;
  dynamic _bankAccount;
  dynamic _bank;
  dynamic _ip;
  dynamic _marketNum;
UserInfoEntity copyWith({  int? id,
  String? phone,
  String? nickname,
  int? pid,
  int? nodeLevel,
  String? nodePath,
  String? inviteCode,
  String? createTime,
  String? updateTime,
  int? status,
  String? headImg,
  int? isReal,
  int? levelId,
  String? balance,
  String? ethAddress,
  String? openid,
  String? wxNickname,
  String? wxName,
  String? wxAccount,
  String? aliName,
  String? aliAccount,
  String? rand,
  String? bao,
  int? directNum,
  dynamic bankName,
  dynamic bankAccount,
  dynamic bank,
  dynamic ip,
  dynamic marketNum,
}) => UserInfoEntity(  id: id ?? _id,
  phone: phone ?? _phone,
  nickname: nickname ?? _nickname,
  pid: pid ?? _pid,
  nodeLevel: nodeLevel ?? _nodeLevel,
  nodePath: nodePath ?? _nodePath,
  inviteCode: inviteCode ?? _inviteCode,
  createTime: createTime ?? _createTime,
  updateTime: updateTime ?? _updateTime,
  status: status ?? _status,
  headImg: headImg ?? _headImg,
  isReal: isReal ?? _isReal,
  levelId: levelId ?? _levelId,
  balance: balance ?? _balance,
  ethAddress: ethAddress ?? _ethAddress,
  openid: openid ?? _openid,
  wxNickname: wxNickname ?? _wxNickname,
  wxName: wxName ?? _wxName,
  wxAccount: wxAccount ?? _wxAccount,
  aliName: aliName ?? _aliName,
  aliAccount: aliAccount ?? _aliAccount,
  rand: rand ?? _rand,
  bao: bao ?? _bao,
  directNum: directNum ?? _directNum,
  bankName: bankName ?? _bankName,
  bankAccount: bankAccount ?? _bankAccount,
  bank: bank ?? _bank,
  ip: ip ?? _ip,
  marketNum: marketNum ?? _marketNum,
);
  int? get id => _id;
  String? get phone => _phone;
  String? get nickname => _nickname;
  int? get pid => _pid;
  int? get nodeLevel => _nodeLevel;
  String? get nodePath => _nodePath;
  String? get inviteCode => _inviteCode;
  String? get createTime => _createTime;
  String? get updateTime => _updateTime;
  int? get status => _status;
  String? get headImg => _headImg;
  int? get isReal => _isReal;
  int? get levelId => _levelId;
  String? get balance => _balance;
  String? get ethAddress => _ethAddress;
  String? get openid => _openid;
  String? get wxNickname => _wxNickname;
  String? get wxName => _wxName;
  String? get wxAccount => _wxAccount;
  String? get aliName => _aliName;
  String? get aliAccount => _aliAccount;
  String? get rand => _rand;
  String? get bao => _bao;
  int? get directNum => _directNum;
  dynamic get bankName => _bankName;
  dynamic get bankAccount => _bankAccount;
  dynamic get bank => _bank;
  dynamic get ip => _ip;
  dynamic get marketNum => _marketNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['nickname'] = _nickname;
    map['pid'] = _pid;
    map['node_level'] = _nodeLevel;
    map['node_path'] = _nodePath;
    map['invite_code'] = _inviteCode;
    map['create_time'] = _createTime;
    map['update_time'] = _updateTime;
    map['status'] = _status;
    map['head_img'] = _headImg;
    map['is_real'] = _isReal;
    map['level_id'] = _levelId;
    map['balance'] = _balance;
    map['eth_address'] = _ethAddress;
    map['openid'] = _openid;
    map['wx_nickname'] = _wxNickname;
    map['wx_name'] = _wxName;
    map['wx_account'] = _wxAccount;
    map['ali_name'] = _aliName;
    map['ali_account'] = _aliAccount;
    map['rand'] = _rand;
    map['bao'] = _bao;
    map['direct_num'] = _directNum;
    map['bank_name'] = _bankName;
    map['bank_account'] = _bankAccount;
    map['bank'] = _bank;
    map['ip'] = _ip;
    map['market_num'] = _marketNum;
    return map;
  }

}