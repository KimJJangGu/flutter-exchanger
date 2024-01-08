import 'dart:convert';

import 'package:exchanger/core/privacy.dart';
import 'package:exchanger/core/result.dart';
import 'package:exchanger/data/data_source/exchange_api.dart';
import 'package:http/http.dart' as http;

class ExchangeApiImpl implements ExchangeApi {
  @override
  Future<Result<List<dynamic>>> currencyApi() async {
    try {
      final http.Request request =
          http.Request('GET', Uri.parse('https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=$apiKey&data=AP01'));
      request.followRedirects = false;
      final response = await request.send();
      if (response.statusCode == 200) {
        return Result.success(jsonDecode(await response.stream.bytesToString()) as List<dynamic>);
      } else {
        return Result.error('오류가 발생했습니다: ${response.statusCode}');
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
