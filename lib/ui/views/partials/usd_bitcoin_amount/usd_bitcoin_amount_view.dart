import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/quote_countdown/quote_countdown.dart';
import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class USDBitcoinAmountView extends StatelessWidget {
  final int purchaseAmount;

  const USDBitcoinAmountView({Key? key, required this.purchaseAmount})
      : super(key: key);
  static const TextStyle textStyle0 =
      TextStyle(fontSize: 34, fontWeight: FontWeight.w900);
  static const TextStyle textStyle1 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  static const TextStyle textStyle2 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<USDBitcoinAmountViewModel>.reactive(
      builder: (context, model, child) => model.isBusy || model.data == null ? LoadingIndicatorView() : 
          Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "You're buying",
                          style: textStyle0,
                        ),
                        Text(
                          model.convertToBtc(purchaseAmount, model.data),
                          style: textStyle1,
                        ),
                        Row(children: [
                          QuoteProgressIndicator(),
                          Text(
                            model.formatPrice(model.data),
                            style: textStyle2,
                          ),
                        ])
                      ]),
                ),
              ),
            ),
      viewModelBuilder: () => USDBitcoinAmountViewModel(),
    );
  }
}
