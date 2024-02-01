import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/models/bitcoin_chart_viewmodel.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/bitcoin_line_chart_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/loading_indicator_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/views/time_period_buttons_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinChartView extends StatelessWidget {
  const BitcoinChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinChartViewModel>.reactive(
      builder: (context, model, child) => model.data != null
          ? Column(
              children: [
                model.calculatePercentChange(
                  model.data![model.currentIndex]['data'],
                ),
                BitcoinLineChartView(
                  data: model.data![model.currentIndex]['data'],
                ),
                TimePeriodButtonsView(
                  data: model.data!,
                  currentIndex: model.currentIndex,
                  onButtonPressed: model.updateCurrentIndex,
                ),
              ],
            )
          : const LoadingIndicatorView(),
      viewModelBuilder: () => BitcoinChartViewModel(),
    );
  }
}
