import 'dart:convert';

import 'package:exchanger/core/privacy.dart';
import 'package:exchanger/core/result.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';
import 'package:http/http.dart' as http;

class ExchangeApiImpl implements ExchangeApi {
  @override
  Future<Result<List<dynamic>>> currencyApi() async {
    final http.Response response = await http.get(Uri.parse('https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=$apiKey&data=AP01'));

    return Result.success(jsonDecode(response.body) as List<dynamic>);
  }
}