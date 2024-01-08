import 'dart:async';

import 'package:exchanger/core/result.dart';
import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/domain/use_case/get_exchange_use_case.dart';
import 'package:exchanger/presenter/exchange_state.dart';
import 'package:exchanger/presenter/exchange_ui_event.dart';
import 'package:flutter/material.dart';

class ExchangeViewModel extends ChangeNotifier {
  final GetExchangeUseCase _getExchangeUseCase;

  ExchangeState _state = const ExchangeState();
  ExchangeState get state => _state;

  final StreamController<ExchangeUiEvent> _uiEventController = StreamController();
  Stream<ExchangeUiEvent> get uiEventStream => _uiEventController.stream;

  ExchangeViewModel({required GetExchangeUseCase getExchangeUseCase}) : _getExchangeUseCase = getExchangeUseCase;



  Future<void> getExchangeInfo() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    Result<List<Exchange>> result = await _getExchangeUseCase.execute();

    switch (result) {
      case Success<List<Exchange>>():
        _state = _state.copyWith(isLoading: false, exchangeList: result.data);
      case Error<List<Exchange>>():
        _state = _state.copyWith(isLoading: false, exchangeList: []);
        print(result.e);
        _uiEventController.add(ExchangeUiEvent.showSnackBar(result.e));
    }
    notifyListeners();
  }
}