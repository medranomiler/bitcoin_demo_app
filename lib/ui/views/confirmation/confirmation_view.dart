import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import "package:lottie/lottie.dart";

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  final int purchaseAmount;

  const ConfirmationView({Key? key, required this.purchaseAmount})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.isBusy
          ? const Center(child: LoadingIndicatorView())
          : SafeArea(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Lottie.asset(
                      'assets/bitcoins.json',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You stacked\nsome sats!",
                          textAlign: TextAlign.center,
                          style: viewModel.textStyle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("\$${purchaseAmount.toString()}",
                                style: viewModel.textStyle0),
                            const Icon(Icons.arrow_right_alt_sharp),
                            Text(
                              viewModel.formatBTC(viewModel.sharedData),
                              style: viewModel.textStyle0,
                            ),
                          ],
                        ),
                        MaterialButton(
                          color: Colors.black,
                          onPressed: () {
                            viewModel.navigateToHomePage();
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(BuildContext context) =>
      ConfirmationViewModel();
}
