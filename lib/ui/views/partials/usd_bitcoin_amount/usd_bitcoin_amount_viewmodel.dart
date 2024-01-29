import 'dart:async';

import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:bitcoin_demo_app/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class USDBitcoinAmountViewModel extends StreamViewModel<int> {
  final _apiService = locator<ApiService>();
  final _sharedDataService = locator<SharedDataService>();

  bool _delayPriceUpdates = false;

  @override
  Stream<int> get stream => _delayPriceUpdates? getDelayedBitcoinPrice() : getBitcoinPrice();

  swapSources(){
    _delayPriceUpdates = !_delayPriceUpdates;
    notifySourceChanged();
  }

  Stream<int> getBitcoinPrice() async* {
    while (true) {
      final response = await _apiService.getBitcoinPrice();
      yield response;
      swapSources();
    }
  }

  Stream<int> getDelayedBitcoinPrice() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      final response = await _apiService.getBitcoinPrice();
      yield response;
    }
  }

  convertToBtc(purchaseAmount, price) {
    double bitcoinAmount = purchaseAmount / price;
    _sharedDataService.sharedData = bitcoinAmount;
    notifyListeners();
    return '${bitcoinAmount.toStringAsFixed(8)} BTC';
  }

  formatPrice(price) {
    return "1 BTC = \$${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}";
  }





  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onCancel() {
    debugPrint("stream cancelled");
  }
}
