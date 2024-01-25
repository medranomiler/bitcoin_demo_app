// import 'dart:async';
// import 'package:bitcoin_demo_app/services/btc_historical_price_service.dart';
// import 'package:bitcoin_demo_app/models/btc_historical_price_model.dart';
// import 'package:flutter/material.dart';

// class BitcoinHistoricalPriceProvider extends ChangeNotifier {
//   final _service = BitcoinHistoricalPriceService();
//   bool isLoading = false;
//   List<BitcoinHistoricalPrice> _prices = [];
//   List<BitcoinHistoricalPrice> get prices => _prices;

//   late Timer _timer;
//   final Duration _fetchInterval = const Duration(minutes: 60);

//   BitcoinHistoricalPriceProvider() {
//     _fetchHistroicalPrices();

//     _timer = Timer.periodic(_fetchInterval, (Timer t) {
//       if (!isLoading) {
//         _fetchHistroicalPrices();
//       }
//     });
//   }

//   Future<void> _fetchHistroicalPrices() async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       final response = await _service.getBitcoinHistoricalPrices();
//       _prices = response;
//     } catch (error) {
//       debugPrint("Error fetching historical btc prices: $error");
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void getHistoricalBitcoinPrices() {}
// }
