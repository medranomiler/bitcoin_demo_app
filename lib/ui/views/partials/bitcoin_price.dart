import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinPriceStream extends StatelessWidget {
  const BitcoinPriceStream({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinPriceStreamModel>.reactive(
      builder: (context, model, child) => Center(
          child: Text(model.data.toString()),
        ),
      viewModelBuilder: () => BitcoinPriceStreamModel(),
    );
  }
}

class BitcoinPriceStreamModel extends StreamViewModel<int> {
  final _apiService = locator<ApiService>();

  @override
  Stream<int> get stream => getBitcoinPrice();

  Stream<int> getBitcoinPrice() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      final response = await _apiService.getBitcoinPrice();
      data = response; 
      yield response;  
    }
  }
}