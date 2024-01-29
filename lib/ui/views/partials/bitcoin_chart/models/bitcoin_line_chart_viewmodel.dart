import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BitcoinLineChartViewModel extends BaseViewModel {
  final List<Color> gradientColors = [Colors.blue, Colors.blue];

  mainData(currentData) {
    double minY =
        currentData.map((spot) => spot.y).reduce((a, b) => a < b ? a : b);
    double maxY =
        currentData.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);
    double minX = currentData.last.x;
    double maxX = currentData.first.x;

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
      minX: minX,
      maxX: maxX,
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
}
