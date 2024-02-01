import 'package:bitcoin_demo_app/ui/views/partials/usd_bitcoin_amount/usd_bitcoin_amount_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'preview_viewmodel.dart';

class PreviewView extends StackedView<PreviewViewModel> {
  final int purchaseAmount;

  const PreviewView({Key? key, required this.purchaseAmount}) : super(key: key);

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
          child: Column(
            children: [
              USDBitcoinAmountView(purchaseAmount: purchaseAmount),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Purchase amount", style: viewModel.textStyle),
                  Text(viewModel.formatPurchaseAmount(viewModel.purchaseAmount),
                      style: viewModel.textStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fees", style: viewModel.textStyle),
                  Text(viewModel.calculateFees(viewModel.purchaseAmount),
                      style: viewModel.textStyle)
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: viewModel.textStyle),
                  Text(viewModel.calculateTotal(viewModel.purchaseAmount),
                      style: viewModel.textStyle)
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            ],
          ),
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
