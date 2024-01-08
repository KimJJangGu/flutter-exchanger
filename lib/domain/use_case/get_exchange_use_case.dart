import 'package:exchanger/core/result.dart';
import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/domain/repository/exchange_repository.dart';

class GetExchangeUseCase {
  final ExchangeRepository _exchangeRepository;

  GetExchangeUseCase({required ExchangeRepository exchangeRepository})
      : _exchangeRepository = exchangeRepository;

  Future<Result<List<Exchange>>> execute() async {
    Result<List<Exchange>> result = await _exchangeRepository.getExchangeList();

    return result.when(
      success: (data) =>
          Result.success(data.where((exchange) => exchange.currencyUnit != 'KRW').toList()),
      error: (e) => Result.error(e),
    );
  }
}
