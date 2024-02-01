import 'package:bitcoin_demo_app/ui/views/bitcoin/bitcoin_price_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class BitcoinPriceView extends StatelessWidget {
  const BitcoinPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinPriceViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: model.isBusy
                    ? const CircularProgressIndicator()
                    : Text(model.data.toString()),
              ),
            ),
        viewModelBuilder: () => BitcoinPriceViewModel());
  }
}
