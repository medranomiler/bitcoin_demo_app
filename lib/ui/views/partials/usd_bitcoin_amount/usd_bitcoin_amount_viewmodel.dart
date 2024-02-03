// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:bitcoin_demo_app/app/app.dialogs.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:bitcoin_demo_app/services/shared_data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import "package:http/http.dart" as http;

class USDBitcoinAmountViewModel extends StreamViewModel<int> {
  final _apiService = locator<ApiService>();
  final _sharedDataService = locator<SharedDataService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool _delayPriceUpdates = false;

  @override
  Stream<int> get stream =>
      _delayPriceUpdates ? getDelayedBitcoinPrice() : getBitcoinPrice();

  swapSources() {
    _delayPriceUpdates = !_delayPriceUpdates;
    notifySourceChanged();
  }

  Stream<int> getBitcoinPrice() async* {
    while (true) {
      final response = await _apiService.getBitcoinPrice(http.Client());
      yield response;
      swapSources();
    }
  }

  Stream<int> getDelayedBitcoinPrice() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      final response = await _apiService.getBitcoinPrice(http.Client());
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
    debugPrint("stream cancelled ${DateTime.now()}");
  }

  @override
  void onError(error) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: "Error",
      description: 'Error obtaining bitcoin price data.',
      mainButtonTitle: "Try Again",
    );
    if (response!.confirmed) {
      _navigationService.replaceWithBuyView();
    }
  }

  TextStyle textStyle0 =
      const TextStyle(fontSize: 34, fontWeight: FontWeight.w900);
  TextStyle textStyle1 =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  TextStyle textStyle2 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}
