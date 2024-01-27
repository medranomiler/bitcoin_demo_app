import 'dart:async';

import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class USDBitcoinAmountViewModel extends StreamViewModel<int>{

  final _apiService = locator<ApiService>();
  bool isFirstRun = true;
  @override
  Stream<int> get stream => getBitcoinPrice();

  Stream<int> getBitcoinPrice() async* {
    
    while (true) {
      if (isFirstRun) {
        isFirstRun = false;
        final response = await _apiService.getBitcoinPrice();
        data = response;
        yield response;
      } else {
        await Future.delayed(const Duration(seconds: 10));
        final response = await _apiService.getBitcoinPrice();
        data = response;
        yield response; 
      }
    }
  }
  convertToBtc(purchaseAmount, price){
   double bitcoinAmount = purchaseAmount / price;
   return '${bitcoinAmount.toStringAsFixed(8)} BTC';
  }

}