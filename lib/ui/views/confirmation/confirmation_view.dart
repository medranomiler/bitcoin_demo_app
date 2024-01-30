import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  final int purchaseAmount;

  const ConfirmationView({Key? key, required this.purchaseAmount})
      : super(key: key);

  static const TextStyle textStyle0 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  static const TextStyle textStyle1 =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w700);

  @override
  Widget builder(
    BuildContext context,
    ConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.isBusy ? Center(child: LoadingIndicatorView()) :  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
            const Text("You stacked\nsome sats!" , textAlign: TextAlign.center, style: textStyle1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text("\$${purchaseAmount.toString()}", style: textStyle0),
                const Icon(Icons.arrow_right_alt_sharp),
                Text(viewModel.formatBTC(viewModel.sharedData),
                    style: textStyle0),
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
          ]),
        ),
      ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConfirmationViewModel();
}
