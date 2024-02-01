import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/quote_countdown/quote_countdown_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class USDBitcoinAmountView extends StatelessWidget {
  final int purchaseAmount;

  const USDBitcoinAmountView({Key? key, required this.purchaseAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<USDBitcoinAmountViewModel>.reactive(
      builder: (context, model, child) => model.isBusy || model.data == null
          ? const LoadingIndicatorView()
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You're buying",
                        style: model.textStyle0,
                      ),
                      Text(
                        model.convertToBtc(purchaseAmount, model.data),
                        style: model.textStyle1,
                      ),
                      Row(
                        children: [
                          const QuoteProgressIndicatorView(),
                          Text(
                            model.formatPrice(model.data),
                            style: model.textStyle2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
      viewModelBuilder: () => USDBitcoinAmountViewModel(),
    );
  }
}
