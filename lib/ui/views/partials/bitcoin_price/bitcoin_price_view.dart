import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinPriceStream extends StatelessWidget {
  const BitcoinPriceStream({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinPriceStreamModel>.reactive(
      builder: (context, model, child) => Center(
        child: Text(
          "\$${model.data.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      viewModelBuilder: () => BitcoinPriceStreamModel(),
    );
  }
}
