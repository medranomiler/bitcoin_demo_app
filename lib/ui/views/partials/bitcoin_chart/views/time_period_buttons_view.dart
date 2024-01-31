import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/models/time_period_buttons_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TimePeriodButtonsView extends StackedView<TimePeriodButtonsViewModel> {
  final List<dynamic> data;
  final int currentIndex;
  final Function(int) onButtonPressed;

  const TimePeriodButtonsView(
      {super.key,
      required this.data,
      required this.currentIndex,
      required this.onButtonPressed});

  @override
  Widget builder(
    BuildContext context,
    TimePeriodButtonsViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      color: Colors.blue.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                viewModel.generateButtons(data, currentIndex, onButtonPressed)),
      ),
    );
  }

  @override
  TimePeriodButtonsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TimePeriodButtonsViewModel();
}
