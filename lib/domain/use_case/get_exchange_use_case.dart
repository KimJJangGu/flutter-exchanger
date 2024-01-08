import 'package:exchanger/core/result.dart';
import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/domain/repository/exchange_repository.dart';

class GetExchangeUseCase {
  final ExchangeRepository _exchangeRepository;

  GetExchangeUseCase({required ExchangeRepository exchangeRepository})
      : _exchangeRepository = exchangeRepository;

  Future<Result<List<Exchange>>> execute() {
    return _exchangeRepository.getExchangeList();
  }
}
