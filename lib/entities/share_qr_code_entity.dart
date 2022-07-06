import 'dart:convert';
/// invite_code : "dfgx13"
/// img : "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG8AAABvAQMAAADYCwwjAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABIUlEQVQ4jdXUvW3FIBAA4ENX0MECSF6DjpWSBRy8AF6JjjWQWMCvo7DeBRzrJU042odc+LNkH9yPAd5xaaItlkMiUWapAIMsBxQPE3Rlpyyo7HWKG2GwOMkAy2HLFAH3BKvD1yYHbOcNtrTrdfwB+5OYP+lPMv+nTnjYJQA+3QTJrM7oiFvMLEVEqiCS+bpijQkOVjCrNXqCLTkeTp3okTJLQefqyEsACyx17QkXFQ+XJwiinpp6pXgm9BIfyYgJgm1RjLJ39cfs7Q241fYRnuBawlu7mg/JU8ni3akkPa/kjPnTh212lMssr/s2DiVIYNkLKk8F97sMXemZjPS8grIMvWPpDsTRu6VVU8fM85pfUds/Clj2+W0dG3+PP+D7rW/XVbyIQ8fElgAAAABJRU5ErkJggg=="
/// url : "http://app.ytsz.vip/#/register?code=dfgx13"

ShareQrCodeEntity shareQrCodeEntityFromJson(String str) => ShareQrCodeEntity.fromJson(json.decode(str));
String shareQrCodeEntityToJson(ShareQrCodeEntity data) => json.encode(data.toJson());
class ShareQrCodeEntity {
  ShareQrCodeEntity({
      String? inviteCode, 
      String? img, 
      String? url,}){
    _inviteCode = inviteCode;
    _img = img;
    _url = url;
}

  ShareQrCodeEntity.fromJson(dynamic json) {
    _inviteCode = json['invite_code'];
    _img = json['img'];
    _url = json['url'];
  }
  String? _inviteCode;
  String? _img;
  String? _url;
ShareQrCodeEntity copyWith({  String? inviteCode,
  String? img,
  String? url,
}) => ShareQrCodeEntity(  inviteCode: inviteCode ?? _inviteCode,
  img: img ?? _img,
  url: url ?? _url,
);
  String? get inviteCode => _inviteCode;
  String? get img => _img;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['invite_code'] = _inviteCode;
    map['img'] = _img;
    map['url'] = _url;
    return map;
  }

}