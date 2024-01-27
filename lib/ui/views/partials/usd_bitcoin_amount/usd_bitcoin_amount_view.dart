import 'package:bitcoin_demo_app/ui/views/partials/quote_countdown/quote_countdown.dart';
import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class USDBitcoinAmountView extends StatelessWidget {
  final int purchaseAmount;

  const USDBitcoinAmountView({Key? key, required this.purchaseAmount})
      : super(key: key);
  static const TextStyle textStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  static const TextStyle textStyle2 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<USDBitcoinAmountViewModel>.reactive(
      builder: (context, model, child) => Center(
        child: Column(children: [
          const Text("You are buying", style: textStyle),
          Text(
            model.convertToBtc(purchaseAmount, model.data),
            style: textStyle,
          ),
          Text("1 BTC = ${model.data.toString()}", style: textStyle2,),
          QuoteProgressIndicator(),
        ]),
      ),
      viewModelBuilder: () => USDBitcoinAmountViewModel(),
    );
  }
}
