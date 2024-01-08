import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange.freezed.dart';
part 'exchange.g.dart';

@freezed
class Exchange with _$Exchange {
  const factory Exchange({
    required String currencyName,
    required String currencyUnit,
    required double transferBuying,
    required double transferSelling,
  }) = _Exchange;

  factory Exchange.fromJson(Map<String, Object?> json) => _$ExchangeFromJson(json);
}