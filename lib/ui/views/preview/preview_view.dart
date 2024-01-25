import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'preview_viewmodel.dart';

class PreviewView extends StackedView<PreviewViewModel> {
  const PreviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PreviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Text("Preview"),
      ),
    );
  }

  @override
  PreviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PreviewViewModel();
}
