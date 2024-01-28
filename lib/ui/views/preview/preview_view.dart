import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'preview_viewmodel.dart';

class PreviewView extends StackedView<PreviewViewModel> {
  final int result;

  const PreviewView({Key? key, required this.result}) : super(key: key);
  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

  @override
  Widget builder(
    BuildContext context,
    PreviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.background),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            USDBitcoinAmountView(purchaseAmount: result),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Purchase amount", style: textStyle),
                Text(viewModel.formatPurchaseAmount(viewModel.result),
                    style: textStyle)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fees", style: textStyle),
                Text(viewModel.calculateFees(viewModel.result),
                    style: textStyle)
              ],
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total", style: textStyle),
                Text(viewModel.calculateTotal(viewModel.result),
                    style: textStyle)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: MaterialButton(
                onPressed: () {
                  viewModel.navigateToConfirmPage();
                },
                color: Colors.black,
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  PreviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PreviewViewModel(result);
}
