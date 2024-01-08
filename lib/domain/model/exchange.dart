import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange.freezed.dart';
part 'exchange.g.dart';

@freezed
class Exchange {
  String currencyName;
  String currencyUnit;
  double transferBuying;
  double transferSelling;


}