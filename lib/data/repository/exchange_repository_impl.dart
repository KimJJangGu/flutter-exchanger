import 'package:exchanger/core/result.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';
import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/domain/repository/exchange_repository.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeApi _exchangeApi;

  ExchangeRepositoryImpl({required ExchangeApi exchangeApi}) : _exchangeApi = exchangeApi;

  @override
  Future<Result<List<Exchange>>> getExchangeList() async {
    try {
      Result<Map<String, dynamic>> result = await _exchangeApi.currencyApi();

      result.when(
        success: (data) {
          print(data);
        },
        error: (e) {

        },
      );
    } catch (e) {
      print(e);
    }

    return Result.error('e');
  }
}