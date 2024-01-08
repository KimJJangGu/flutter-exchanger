import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_ui_event.freezed.dart';

@freezed
sealed class ExchangeUiEvent with _$ExchangeUiEvent {
  const factory ExchangeUiEvent.showSnackBar( String e) = showSnackBar;
}