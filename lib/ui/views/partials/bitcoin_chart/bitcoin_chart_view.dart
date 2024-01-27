import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/bitcoin_chart_viewmodel.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/bitcoin_line_chart_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/loading_indicator_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/time_period_buttons_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinChartView extends StatefulWidget {
  const BitcoinChartView({Key? key}) : super(key: key);

  @override
  State<BitcoinChartView> createState() => _BitcoinChartViewState();
}

class _BitcoinChartViewState extends State<BitcoinChartView> {
  int currentIndex = 0;
  double percentChange = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinChartViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? const LoadingIndicatorView()
          : Column(
              children: [
                model.calculatePercentChange(model.data![currentIndex]['data']),
                BitcoinLineChartView(data: model.data![currentIndex]['data']),
                TimePeriodButtonsView(
                  data: model.data!,
                  currentIndex: currentIndex,
                  onButtonPressed: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ],
            ),
      viewModelBuilder: () => BitcoinChartViewModel(),
    );
  }
}
