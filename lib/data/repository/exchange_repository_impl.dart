import 'package:exchanger/core/result.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';
import 'package:exchanger/data/dto/exchange_dto.dart';
import 'package:exchanger/data/mapper/exchange_mapper.dart';
import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/domain/repository/exchange_repository.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeApi _exchangeApi;

  ExchangeRepositoryImpl({required ExchangeApi exchangeApi}) : _exchangeApi = exchangeApi;

  @override
  Future<Result<List<Exchange>>> getExchangeList() async {
    try {
      Result<List<dynamic>> result = await _exchangeApi.currencyApi();

      if(result is Success<List<dynamic>>) {
        return Result.success(result.data.map((e) => ExchangeDto.fromJson(e).toExchangeModel()).toList());
      }

    } catch (e) { }

    return const Result.error('네트워크 에러');
  }
}