import 'dart:async';
import 'package:flutter/material.dart';
import 'btc_price_service.dart';

class BitcoinPriceProvider extends ChangeNotifier {
  final _service = BitcoinPriceService();
  bool isLoading = false;
  int _btcPrice = 0;
  int get bitcoinPrice => _btcPrice;

  late Timer _timer;
  final Duration _fetchInterval = const Duration(seconds: 20);

  BitcoinPriceProvider() {
    _fetchBitcoinPrice();

    _timer = Timer.periodic(_fetchInterval, (Timer t) {
      if (!isLoading) {
        _fetchBitcoinPrice();
      }
    });
  }

  Future<void> _fetchBitcoinPrice() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getBitcoinPrice();
      _btcPrice = response;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
