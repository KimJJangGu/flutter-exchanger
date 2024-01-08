import 'dart:convert';

import 'package:exchanger/core/result.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';

class ExchangeMockApi implements ExchangeApi {
  @override
  Future<Result<List>> currencyApi() async {
    final mockData = '''[{"result":1,"cur_unit":"AED","ttb":"354.09","tts":"361.24","deal_bas_r":"357.67","bkpr":"357","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"357","kftc_deal_bas_r":"357.67","cur_nm":"아랍에미리트 디르함"},{"result":1,"cur_unit":"AUD","ttb":"872.94","tts":"890.57","deal_bas_r":"881.76","bkpr":"881","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"881","kftc_deal_bas_r":"881.76","cur_nm":"호주 달러"},{"result":1,"cur_unit":"BHD","ttb":"3,449.86","tts":"3,519.55","deal_bas_r":"3,484.71","bkpr":"3,484","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"3,484","kftc_deal_bas_r":"3,484.71","cur_nm":"바레인 디나르"},{"result":1,"cur_unit":"BND","ttb":"978.05","tts":"997.8","deal_bas_r":"987.93","bkpr":"987","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"987","kftc_deal_bas_r":"987.93","cur_nm":"브루나이 달러"},{"result":1,"cur_unit":"CAD","ttb":"973.07","tts":"992.72","deal_bas_r":"982.9","bkpr":"982","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"982","kftc_deal_bas_r":"982.9","cur_nm":"캐나다 달러"},{"result":1,"cur_unit":"CHF","ttb":"1,528.36","tts":"1,559.23","deal_bas_r":"1,543.8","bkpr":"1,543","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"1,543","kftc_deal_bas_r":"1,543.8","cur_nm":"스위스 프랑"},{"result":1,"cur_unit":"CNH","ttb":"181.17","tts":"184.83","deal_bas_r":"183","bkpr":"183","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"183","kftc_deal_bas_r":"183","cur_nm":"위안화"},{"result":1,"cur_unit":"DKK","ttb":"190.79","tts":"194.64","deal_bas_r":"192.72","bkpr":"192","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"192","kftc_deal_bas_r":"192.72","cur_nm":"덴마아크 크로네"},{"result":1,"cur_unit":"EUR","ttb":"1,422.81","tts":"1,451.56","deal_bas_r":"1,437.19","bkpr":"1,437","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"1,437","kftc_deal_bas_r":"1,437.19","cur_nm":"유로"},{"result":1,"cur_unit":"GBP","ttb":"1,653.4","tts":"1,686.81","deal_bas_r":"1,670.11","bkpr":"1,670","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"1,670","kftc_deal_bas_r":"1,670.11","cur_nm":"영국 파운드"},{"result":1,"cur_unit":"HKD","ttb":"166.48","tts":"169.85","deal_bas_r":"168.17","bkpr":"168","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"168","kftc_deal_bas_r":"168.17","cur_nm":"홍콩 달러"},{"result":1,"cur_unit":"IDR(100)","ttb":"8.38","tts":"8.55","deal_bas_r":"8.47","bkpr":"8","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"8","kftc_deal_bas_r":"8.47","cur_nm":"인도네시아 루피아"},{"result":1,"cur_unit":"JPY(100)","ttb":"898.39","tts":"916.54","deal_bas_r":"907.47","bkpr":"907","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"907","kftc_deal_bas_r":"907.47","cur_nm":"일본 옌"},{"result":1,"cur_unit":"KRW","ttb":"0","tts":"0","deal_bas_r":"1","bkpr":"1","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"1","kftc_deal_bas_r":"1","cur_nm":"한국 원"},{"result":1,"cur_unit":"KWD","ttb":"4,231.39","tts":"4,316.88","deal_bas_r":"4,274.14","bkpr":"4,274","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"4,274","kftc_deal_bas_r":"4,274.14","cur_nm":"쿠웨이트 디나르"},{"result":1,"cur_unit":"MYR","ttb":"279.44","tts":"285.09","deal_bas_r":"282.27","bkpr":"282","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"282","kftc_deal_bas_r":"282.27","cur_nm":"말레이지아 링기트"},{"result":1,"cur_unit":"NOK","ttb":"125.93","tts":"128.48","deal_bas_r":"127.21","bkpr":"127","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"127","kftc_deal_bas_r":"127.21","cur_nm":"노르웨이 크로네"},{"result":1,"cur_unit":"NZD","ttb":"812.13","tts":"828.54","deal_bas_r":"820.34","bkpr":"820","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"820","kftc_deal_bas_r":"820.34","cur_nm":"뉴질랜드 달러"},{"result":1,"cur_unit":"SAR","ttb":"346.76","tts":"353.77","deal_bas_r":"350.27","bkpr":"350","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"350","kftc_deal_bas_r":"350.27","cur_nm":"사우디 리얄"},{"result":1,"cur_unit":"SEK","ttb":"126.63","tts":"129.18","deal_bas_r":"127.91","bkpr":"127","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"127","kftc_deal_bas_r":"127.91","cur_nm":"스웨덴 크로나"},{"result":1,"cur_unit":"SGD","ttb":"978.05","tts":"997.8","deal_bas_r":"987.93","bkpr":"987","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"987","kftc_deal_bas_r":"987.93","cur_nm":"싱가포르 달러"},{"result":1,"cur_unit":"THB","ttb":"37.52","tts":"38.27","deal_bas_r":"37.9","bkpr":"37","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"37","kftc_deal_bas_r":"37.9","cur_nm":"태국 바트"},{"result":1,"cur_unit":"USD","ttb":"1,300.56","tts":"1,326.83","deal_bas_r":"1,313.7","bkpr":"1,313","yy_efee_r":"0","ten_dd_efee_r":"0","kftc_bkpr":"1,313","kftc_deal_bas_r":"1,313.7","cur_nm":"미국 달러"}]''';

    return Result.success(jsonDecode(mockData));
  }

}