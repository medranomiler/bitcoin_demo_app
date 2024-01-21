import 'package:bitcoin_demo_app/btc_historical_price_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BitcoinLineChart extends StatefulWidget {
  const BitcoinLineChart({Key? key}) : super(key: key);

  @override
  State<BitcoinLineChart> createState() => _BitcoinLineChartState();
}

class _BitcoinLineChartState extends State<BitcoinLineChart> {
  List<Color> gradientColors = [Colors.blue, Colors.blue];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BitcoinHistoricalPriceProvider>(context, listen: false)
          .getHistoricalPrices();
    });
  }

  LineChartData mainData(List<FlSpot> formattedData) {
    return LineChartData(
      lineTouchData: const LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          fitInsideHorizontally: true,
        ),
      ),
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 1500000000,
      maxX: 1705860000,
      minY: 0,
      maxY: 70000,
      backgroundColor: Colors.white,
      lineBarsData: [
        LineChartBarData(
          spots: formattedData,
          isCurved: true,
          color: Colors.blue,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

@override
Widget build(BuildContext context) {
  return Consumer<BitcoinHistoricalPriceProvider>(
    builder: (context, value, child) {
      final prices = value.prices;
      List<FlSpot> formattedData = prices.where((e) => e.usd != -1.0).map((e) => FlSpot(e.time.toDouble(), e.usd.toDouble())).toList();
      return Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              mainData(formattedData),
            ),
          ),
        ],
      );
    },
  );
}
}
