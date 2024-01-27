import 'package:bitcoin_demo_app/ui/common/ui_helpers.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/bitcoin_chart_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinLineChartView extends StatefulWidget {
  const BitcoinLineChartView({Key? key}) : super(key: key);

  @override
  State<BitcoinLineChartView> createState() => _BitcoinLineChartViewState();
}

class _BitcoinLineChartViewState extends State<BitcoinLineChartView> {
  List<Color> gradientColors = [Colors.blue, Colors.blue];
  int currentIndex = 0;
  double percentChange = 0;

  @override
  void initState() {
    super.initState();
  }

  calculatePercentChange(List<FlSpot> data) {
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

  mainData(currentData) {
    double minY =
        currentData.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    double maxY =
        currentData.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);

    return LineChartData(
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return const TouchedSpotIndicatorData(
              FlLine(
                strokeWidth: 0,
              ),
              FlDotData(
                show: true,
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final FlSpot spot = touchedSpot;
              return LineTooltipItem(
                "\$${spot.y.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w600),
              );
            }).toList();
          },
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
      minX: currentData.last.x,
      maxX: currentData.first.x,
      minY: minY,
      maxY: maxY,
      backgroundColor: Colors.white,
      lineBarsData: [
        LineChartBarData(
          spots: currentData,
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

  TextStyle buttonStyle(int index) {
    return TextStyle(
      color: currentIndex == index ? Colors.blue : Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BitcoinLineChartViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Loading ...', style: TextStyle(fontSize: 16)),
                horizontalSpaceSmall,
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 6,
                  ),
                )
              ],
            )
          : Column(
              children: [
                calculatePercentChange(model.data![currentIndex]['data']),
                AspectRatio(
                  aspectRatio: 1.70,
                  child: LineChart(
                    mainData(model.data![currentIndex]['data']),
                    duration: const Duration(milliseconds: 0),
                  ),
                ),
                Container(
                  color: Colors.blue.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < model.data!.length; i++)
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                currentIndex = i;
                              });
                            },
                            color: Colors.black,
                            child: Text(model.data![i]['name'], style: buttonStyle(i),),
                          ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
      viewModelBuilder: () => BitcoinLineChartViewModel(),
    );
  }
}
