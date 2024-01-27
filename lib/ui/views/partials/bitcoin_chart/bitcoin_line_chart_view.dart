import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/bitcoin_line_chart_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinLineChartView extends StackedView<BitcoinLineChartViewModel> {
  final List<FlSpot> data;

  const BitcoinLineChartView({super.key, required this.data});

  @override
  Widget builder(
    BuildContext context,
    BitcoinLineChartViewModel viewModel,
    Widget? child,
  ) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        viewModel.mainData(data),
        duration: const Duration(milliseconds: 0),
      ),
    );
  }

  @override
  BitcoinLineChartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BitcoinLineChartViewModel();
}
