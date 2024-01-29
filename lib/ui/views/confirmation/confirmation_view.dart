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
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          automaticallyImplyLeading: false),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
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
