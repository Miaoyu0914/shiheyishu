import 'dart:convert';
/// ios_version : null
/// version : "1.0.1"
/// download : "http://app.ytsz.vip/"

DownloadEntity downloadEntityFromJson(String str) => DownloadEntity.fromJson(json.decode(str));
String downloadEntityToJson(DownloadEntity data) => json.encode(data.toJson());
class DownloadEntity {
  DownloadEntity({
      dynamic iosVersion, 
      String? version, 
      String? download,}){
    _iosVersion = iosVersion;
    _version = version;
    _download = download;
}

  DownloadEntity.fromJson(dynamic json) {
    _iosVersion = json['ios_version'];
    _version = json['version'];
    _download = json['download'];
  }
  dynamic _iosVersion;
  String? _version;
  String? _download;
DownloadEntity copyWith({  dynamic iosVersion,
  String? version,
  String? download,
}) => DownloadEntity(  iosVersion: iosVersion ?? _iosVersion,
  version: version ?? _version,
  download: download ?? _download,
);
  dynamic get iosVersion => _iosVersion;
  String? get version => _version;
  String? get download => _download;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ios_version'] = _iosVersion;
    map['version'] = _version;
    map['download'] = _download;
    return map;
  }

}