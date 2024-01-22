import 'package:bitcoin_demo_app/services/btc_historical_price_service.dart';
import 'package:bitcoin_demo_app/models/btc_historical_price_model.dart';
import 'package:flutter/material.dart';


class BitcoinHistoricalPriceProvider extends ChangeNotifier {
  final _service = BitcoinHistoricalPriceService();
  bool isLoading = false;
  List<BitcoinHistoricalPrice> _prices = [];
  List<BitcoinHistoricalPrice> get prices => _prices;


Future<void> getHistoricalPrices() async {
  isLoading = true;
  notifyListeners();

  final response = await _service.getBitcoinHistoricalPrices();

  _prices = response;
  isLoading = false;
  notifyListeners();
}
}