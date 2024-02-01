import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinPriceStream extends StatelessWidget {
  const BitcoinPriceStream({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinPriceStreamModel>.reactive(
      builder: (context, model, child) => model.isBusy || model.data == null ? LoadingIndicatorView() : Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "BITCOIN PRICE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            model.formatPrice(model.data),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      )),
      viewModelBuilder: () => BitcoinPriceStreamModel(),
    );
  }
}
