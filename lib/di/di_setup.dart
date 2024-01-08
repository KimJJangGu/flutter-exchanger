import 'package:exchanger/data/data_source/exchange_api_impl.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';
import 'package:exchanger/data/repository/exchange_repository_impl.dart';
import 'package:exchanger/domain/repository/exchange_repository.dart';
import 'package:exchanger/domain/use_case/get_exchange_use_case.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void diSetUp() {
  getIt.registerSingleton<ExchangeApi>(ExchangeApiImpl());
  getIt.registerSingleton<ExchangeRepository>(ExchangeRepositoryImpl(exchangeApi: getIt<ExchangeApi>()));
  getIt.registerSingleton<GetExchangeUseCase>(GetExchangeUseCase(exchangeRepository: getIt<ExchangeRepository>()));
}