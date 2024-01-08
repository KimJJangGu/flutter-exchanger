class ExchangeDto {
  ExchangeDto({
      this.result, 
      this.curUnit, 
      this.ttb, 
      this.tts, 
      this.dealBasR, 
      this.bkpr, 
      this.yyEfeeR, 
      this.tenDdEfeeR, 
      this.kftcBkpr, 
      this.kftcDealBasR, 
      this.curNm,});

  ExchangeDto.fromJson(dynamic json) {
    result = json['result'];
    curUnit = json['cur_unit'];
    ttb = json['ttb'];
    tts = json['tts'];
    dealBasR = json['deal_bas_r'];
    bkpr = json['bkpr'];
    yyEfeeR = json['yy_efee_r'];
    tenDdEfeeR = json['ten_dd_efee_r'];
    kftcBkpr = json['kftc_bkpr'];
    kftcDealBasR = json['kftc_deal_bas_r'];
    curNm = json['cur_nm'];
  }
  num? result;
  String? curUnit;
  String? ttb;
  String? tts;
  String? dealBasR;
  String? bkpr;
  String? yyEfeeR;
  String? tenDdEfeeR;
  String? kftcBkpr;
  String? kftcDealBasR;
  String? curNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['cur_unit'] = curUnit;
    map['ttb'] = ttb;
    map['tts'] = tts;
    map['deal_bas_r'] = dealBasR;
    map['bkpr'] = bkpr;
    map['yy_efee_r'] = yyEfeeR;
    map['ten_dd_efee_r'] = tenDdEfeeR;
    map['kftc_bkpr'] = kftcBkpr;
    map['kftc_deal_bas_r'] = kftcDealBasR;
    map['cur_nm'] = curNm;
    return map;
  }

}