import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Text("Confirmation"),
      ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConfirmationViewModel();
}
