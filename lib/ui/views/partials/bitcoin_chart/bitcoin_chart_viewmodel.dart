import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';

class BitcoinLineChartViewModel extends StreamViewModel<List> {
  final _apiService = locator<ApiService>();
  bool isFirstRun = true;

  @override
  Stream<List> get stream => getFormattedDataArray();

  Stream<List> getFormattedDataArray() async* {
    setBusy(true);
    while (true) {
      if (isFirstRun) {
        isFirstRun = false;
        final response = await _apiService.getBitcoinHistoricalPrices();
        List<FlSpot> formattedDataAll = response
            .where((e) => e.usd > 1)
            .toList()
            .map((e) => FlSpot(e.time.toDouble(), e.usd.toDouble()))
            .toList();
        List formattedDataArray = [
          {
            'name': "1W",
            'data': formattedDataAll.sublist(0, 168),
          },
          {
            'name': "1M",
            'data': formattedDataAll.sublist(0, 720),
          },
          {
            'name': "1YR",
            'data': formattedDataAll.sublist(0, 8760),
          },
          {
            'name': "ALL",
            'data': formattedDataAll,
          },
        ];
        setBusy(false);
        yield formattedDataArray;
      } else {

        await Future.delayed(const Duration(minutes: 60));
        final response = await _apiService.getBitcoinHistoricalPrices();
        List<FlSpot> formattedDataAll = response
            .where((e) => e.usd > 1)
            .toList()
            .map((e) => FlSpot(e.time.toDouble(), e.usd.toDouble()))
            .toList();
        List formattedDataArray = [
          {
            'name': "1W",
            'data': formattedDataAll.sublist(0, 168),
          },
          {
            'name': "1M",
            'data': formattedDataAll.sublist(0, 720),
          },
          {
            'name': "1YR",
            'data': formattedDataAll.sublist(0, 8760),
          },
          {
            'name': "ALL",
            'data': formattedDataAll,
          },
        ];

        yield formattedDataArray;
      }
    }
  }
}
