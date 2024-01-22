import 'package:bitcoin_demo_app/models/btc_historical_price_model.dart';
import 'package:bitcoin_demo_app/providers/btc_historical_price_provider.dart';
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
  double minX = 1279497600;
  double maxX = 1705896000;
  double minY = 0;
  double maxY = 100000;
  bool isOneWeek = false;
  bool isOneMonth = false;
  bool isOneYear = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BitcoinHistoricalPriceProvider>(context, listen: false)
          .getHistoricalPrices();
    });
  }

  LineChartData mainData(List<FlSpot> formattedDataAll) {
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
                ));
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
      minX: minX,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      backgroundColor: Colors.white,
      lineBarsData: [
        LineChartBarData(
          spots: isOneWeek
              ? formattedDataAll.sublist(0, 168)
              : isOneMonth
                  ? formattedDataAll.sublist(0, 719)
                  : isOneYear
                      ? formattedDataAll.sublist(0, 8759)
                      : formattedDataAll,
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
        List<BitcoinHistoricalPrice> filteredPrices =
            prices.where((e) => e.usd != -1.0).toList();
        List<FlSpot> formattedDataAll = filteredPrices
            .map((e) => FlSpot(e.time.toDouble(), e.usd.toDouble()))
            .toList();
        return Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.70,
              child: LineChart(
                mainData(formattedDataAll),
                duration: const Duration(milliseconds: 0),
              ),
            ),
            Container(
              color: Colors.blue.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(8),
                // Set your desired background color here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        List<FlSpot> oneWeekPrices =
                            List.from(formattedDataAll.sublist(0, 167));
                        double oneWeekMinX = oneWeekPrices.last.x;
                        double oneWeekMaxX = oneWeekPrices.first.x;
                        oneWeekPrices.sort((a, b) => b.y.compareTo(a.y));
                        double oneWeekMinY = oneWeekPrices.last.y;
                        double oneWeekMaxY = oneWeekPrices.first.y;
                        debugPrint("oneWeekMinX: $oneWeekMinX");
                        debugPrint("oneWeekMaxX: $oneWeekMaxX");
                        debugPrint("oneWeekMinY: $oneWeekMinY");
                        debugPrint("oneWeekMaxY: $oneWeekMaxY");
                        setState(() {
                          isOneYear = false;
                          isOneMonth = false;
                          isOneWeek = true;
                          minX = oneWeekMinX;
                          maxX = oneWeekMaxX;
                          minY = oneWeekMinY - 1000;
                          maxY = oneWeekMaxY + 1000;
                        });
                      },
                      child: const Text(
                        "1W",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<FlSpot> oneMonthPrices =
                            List.from(formattedDataAll.sublist(0, 719));
                        double oneMonthMinX = oneMonthPrices.last.x;
                        double oneMonthMaxX = oneMonthPrices.first.x;
                        oneMonthPrices.sort((a, b) => b.y.compareTo(a.y));
                        double oneMonthMinY = oneMonthPrices.last.y;
                        double oneMonthMaxY = oneMonthPrices.first.y;
                        debugPrint("oneMonthMinX: $oneMonthMinX");
                        debugPrint("oneMonthMaX: $oneMonthMaxX");
                        debugPrint("oneMonthMinY: $oneMonthMinY");
                        debugPrint("oneMonthMaxY: $oneMonthMaxY");
                        setState(() {
                          isOneYear = false;
                          isOneWeek = false;
                          isOneMonth = true;
                          minX = oneMonthMinX;
                          maxX = oneMonthMaxX;
                          minY = oneMonthMinY - 1000;
                          maxY = oneMonthMaxY + 1000;
                        });
                      },
                      child: const Text(
                        "1M",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<FlSpot> oneYearPrices =
                            List.from(formattedDataAll.sublist(0, 8759));
                        double oneYearMinX = oneYearPrices.last.x;
                        double oneYearMaxX = oneYearPrices.first.x;
                        formattedDataAll.sort((a, b) => b.y.compareTo(a.y));
                        double oneYearMinY = formattedDataAll.last.y;
                        double oneYearMaxY = formattedDataAll.first.y;
                        debugPrint("oneYearMinX: $oneYearMinX");
                        debugPrint("oneYearMaxX: $oneYearMaxX");
                        debugPrint("oneYearMinY: $oneYearMinY");
                        debugPrint("oneYearMaxY: $oneYearMaxY");
                        setState(() {
                          isOneMonth = false;
                          isOneWeek = false;
                          isOneYear = true;
                          minX = oneYearMinX;
                          maxX = oneYearMaxX;
                          minY = oneYearMinY;
                          maxY = oneYearMaxY;
                        });
                      },
                      child: const Text(
                        "1Y",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        double allMinX = formattedDataAll.last.x;
                        double allMaxX = formattedDataAll.first.x;
                        formattedDataAll.sort((a, b) => b.y.compareTo(a.y));
                        double allMinY = formattedDataAll.last.y;
                        double allMaxY = formattedDataAll.first.y;
                        debugPrint("allMinY: $allMinY");
                        debugPrint("allMaxY: $allMaxY");
                        debugPrint("allMinX: $allMinX");
                        debugPrint("allMaxX: $allMaxX");

                        setState(() {
                          isOneMonth = false;
                          isOneWeek = false;
                          isOneYear = false;
                          minX = allMinX;
                          maxX = allMaxX;
                          minY = allMinY;
                          maxY = allMaxY;
                        });
                      },
                      child: const Text(
                        "ALL",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
