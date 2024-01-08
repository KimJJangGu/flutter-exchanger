import 'package:exchanger/data/dto/exchange_dto.dart';
import 'package:exchanger/domain/model/exchange.dart';

extension ExchangeMapper on ExchangeDto {
  Exchange toExchangeModel() {
    return Exchange(
      currencyName: curNm ?? '통화명 없음',
      currencyUnit: curUnit ?? '통화코드 없음',
      transferBuying: double.parse(ttb ?? '0.0'),
      transferSelling: double.parse(tts ?? '0.0'),
    );
  }
}