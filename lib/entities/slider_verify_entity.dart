import 'dart:convert';
/// sig : "05XqrtZ0EaFgmmqIQes-s-CDKblrhP67TIFPz9L3onFxbUJygmemOqGr8mpEQLzAZ1w6Wt682UvkUuxwafl9SGN7i8z_8ORdUCOjt6MCZoF8wg4h7rVpGv-G7vTFve3jrg_NFsXrmsPl5Gj8zIPv0xxvQhv9XdaQ9ikM6oSMRZZYttkrx0-32MMYcmeTOXKWJXUR5kN1JWzHSRxRrMqhTwMvQWJacDuYVW5h5oGyuAcukB2xzcV5MUS2xbZ9xPCUsMCmRYd4puzzkhKCSsWkVt8eL8V1N8Teg5JzxXTpStK1MDObuFxu28qROgwSTmsweK2yOmz2GdS1tMbyXwo-aYqPO9U8RlzrS5h_YI2dgFpXgUtVmbnzJ91mxPIer7OaKrpqGU1GiZ1ENq3Ul-o5dg_Mf_y7NgxL99uFfUIC__SIdefNR4gBptV3Sef9QotxB2HuWPk8wQLtowh3CU9F4ZqTEpEe6Z1H-y1tABYZcy9nkWbIEKbzEkYV9To_xz77PSgUFtx_imrx76Wud7o5AXVQ"
/// sessionId : "01j8h0pMydQXo1Oevsk7Uty0brnJA1l1EqYdnO7yBeXNb8UJ4_ppkEuSwLyCCbtXDv2akqYVJvR6S-UTFAp9OyD09Rp-I3W-WSP9qUwEI6EY9mSKZwZsD5eWXAjaj23zeT1Z416EVhc4Cul1r5cM2IQSWlwRwEF5JBE983blgUlQWG9GpNfns9N0ehQG_N0ZV-0ESgfxCmt0hgPSbDVOcu9ajh02BKnl3HnQfMhOzQ7QQ"
/// token : "FFFF0N0000000000AAB1:nc_other_h5:1659346045294:0.6561966613789879"

SliderVerifyEntity sliderVerifyEntityFromJson(String str) => SliderVerifyEntity.fromJson(json.decode(str));
String sliderVerifyEntityToJson(SliderVerifyEntity data) => json.encode(data.toJson());
class SliderVerifyEntity {
  SliderVerifyEntity({
      String? sig, 
      String? sessionId, 
      String? token,}){
    _sig = sig;
    _sessionId = sessionId;
    _token = token;
}

  SliderVerifyEntity.fromJson(dynamic json) {
    _sig = json['sig'];
    _sessionId = json['sessionId'];
    _token = json['token'];
  }
  String? _sig;
  String? _sessionId;
  String? _token;
SliderVerifyEntity copyWith({  String? sig,
  String? sessionId,
  String? token,
}) => SliderVerifyEntity(  sig: sig ?? _sig,
  sessionId: sessionId ?? _sessionId,
  token: token ?? _token,
);
  String? get sig => _sig;
  String? get sessionId => _sessionId;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sig'] = _sig;
    map['sessionId'] = _sessionId;
    map['token'] = _token;
    return map;
  }

}