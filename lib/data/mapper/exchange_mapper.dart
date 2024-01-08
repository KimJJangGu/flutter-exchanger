import 'package:exchanger/data/dto/exchange_dto.dart';
import 'package:exchanger/domain/model/exchange.dart';

extension ExchangeMapper on ExchangeDto {
  Exchange toExchangeModel() {
    return Exchange(
      currencyName: curNm ?? '통화명 없음',
      currencyUnit: curUnit ?? '통화코드 없음',
      transferBuying: _parseTransfer(ttb),
      transferSelling: _parseTransfer(ttb),
    );
  }

  double _parseTransfer(String? transfer) {
    if(transfer == null) {
      return 0.0;
    }
    return double.parse(transfer.replaceAll(',', ''));
  }
}