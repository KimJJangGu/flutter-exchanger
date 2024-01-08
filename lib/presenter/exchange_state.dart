import 'package:exchanger/domain/model/exchange.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exchange_state.freezed.dart';

part 'exchange_state.g.dart';

@freezed
class ExchangeState with _$ExchangeState {
  const factory ExchangeState({
    @Default(false) bool isLoading,
    @Default([]) List<Exchange> exchangeList,
  }) = _ExchangeState;

  factory ExchangeState.fromJson(Map<String, Object?> json) => _$ExchangeStateFromJson(json);
}