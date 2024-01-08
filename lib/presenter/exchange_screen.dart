import 'package:exchanger/domain/model/exchange.dart';
import 'package:exchanger/presenter/exchange_state.dart';
import 'package:exchanger/presenter/exchange_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<ExchangeViewModel>().getExchangeInfo();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ExchangeViewModel exchangeViewModel = context.watch();
    final ExchangeState exchangeState = exchangeViewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 환율'),
      ),
      body: ListView.builder(
        itemCount: exchangeState.exchangeList.length,
        itemBuilder: (context, index) {
          final Exchange exchange = exchangeState.exchangeList[index];
          return ListTile(
            title: Text('${exchange.currencyName}(${exchange.currencyUnit})'),
            subtitle: Text('살때: ${exchange.transferBuying}\t/\t팔때: ${exchange.transferSelling}'),
          );
        },
      ),
    );
  }
}
