import 'dart:async';

import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/presenter/exchange_state.dart';
import 'package:exchanger/presenter/exchange_ui_event.dart';
import 'package:exchanger/presenter/exchange_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    Future.microtask(() {
      final ExchangeViewModel viewModel = context.read<ExchangeViewModel>();
      viewModel.getExchangeInfo();

      _streamSubscription = viewModel.uiEventStream.listen((event) {
        switch (event) {
          case showSnackBar():
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(SnackBar(
                  content: Text(event.e), duration: const Duration(milliseconds: 500)));
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ExchangeViewModel exchangeViewModel = context.watch();
    final ExchangeState exchangeState = exchangeViewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 환율'),
      ),
      body: exchangeState.isLoading ?
      const Center(child: CircularProgressIndicator()) :
      RefreshIndicator(
        onRefresh: () => exchangeViewModel.getExchangeInfo(),
        child: ListView.builder(
          itemCount: exchangeState.exchangeList.length,
          itemBuilder: (context, index) {
            final Exchange exchange = exchangeState.exchangeList[index];
            return ListTile(
              title: Text('${exchange.currencyName}(${exchange.currencyUnit})'),
              subtitle: Text('송금받을때: ${exchange.transferBuying}원\t/\t송금보낼때: ${exchange.transferSelling}원'),
            );
          },
        ),
      ),
    );
  }
}
