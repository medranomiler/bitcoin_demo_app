import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import "package:http/http.dart" as http;

class BitcoinChartViewModel extends StreamViewModel<List> {
  final _apiService = locator<ApiService>();
  bool _delayPriceUpdates = false;

  @override
  Stream<List> get stream =>
      _delayPriceUpdates ? getDelayedDataArray() : getDataArray();

  swapSources() {
    _delayPriceUpdates = !_delayPriceUpdates;
    notifySourceChanged();
  }

  Stream<List> getDataArray() async* {
    while (true) {
      final response = await _apiService.getBitcoinHistoricalPrices(http.Client());
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
      swapSources();
    }
  }

  Stream<List> getDelayedDataArray() async* {
    setBusy(true);
    while (true) {
      await Future.delayed(const Duration(minutes: 60));
      final response = await _apiService.getBitcoinHistoricalPrices(http.Client());
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

  Widget calculatePercentChange(List<FlSpot> data) {
    double currentValue = data.first.y;
    double prevValue = data.last.y;

    double percentChange = ((currentValue - prevValue) / prevValue * 100);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Text(
        "${percentChange > 0 ? "+${percentChange.toStringAsFixed(2)}" : percentChange.toStringAsFixed(2)}%",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: percentChange > 0 ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
