import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buy_viewmodel.dart';

class BuyView extends StackedView<BuyViewModel> {
  const BuyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: MaterialButton(
            color: Colors.black,
            onPressed: () {
              viewModel.goBack();
            },
            child: const Text(
              "go back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  BuyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyViewModel();
}
