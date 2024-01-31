import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'preview_viewmodel.dart';

class PreviewView extends StackedView<PreviewViewModel> {
  final int purchaseAmount;

  const PreviewView({Key? key, required this.purchaseAmount}) : super(key: key);
  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

  @override
  Widget builder(
    BuildContext context,
    PreviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          child: Column(children: [
            USDBitcoinAmountView(purchaseAmount: purchaseAmount),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Purchase amount", style: textStyle),
                Text(viewModel.formatPurchaseAmount(viewModel.purchaseAmount),
                    style: textStyle)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fees", style: textStyle),
                Text(viewModel.calculateFees(viewModel.purchaseAmount),
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
                Text(viewModel.calculateTotal(viewModel.purchaseAmount),
                    style: textStyle)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      viewModel.goBack();
                    },
                    child: const Text(
                      "back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      viewModel.navigateToConfirmPage(purchaseAmount);
                    },
                    child: const Text(
                      "Buy",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
      PreviewViewModel(purchaseAmount);
}
