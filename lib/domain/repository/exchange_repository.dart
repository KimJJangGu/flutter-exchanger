import 'package:exchanger/core/result.dart';
import 'package:exchanger/domain/model/exchange.dart';

abstract interface class ExchangeRepository {
  Future<Result<List<Exchange>>> getExchangeList();
}