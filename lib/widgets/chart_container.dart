
// import "package:bitcoin_demo_app/models/btc_historical_price_model.dart";
// import 'package:bitcoin_demo_app/widgets/bitcoin_chart.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChartContainer extends StatefulWidget {
//   const ChartContainer({super.key});

//   @override
//   State<ChartContainer> createState() => _ChartContainerState();
// }

// class _ChartContainerState extends State<ChartContainer> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timestamp) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BitcoinHistoricalPriceProvider>(
//         builder: (context, value, child) {
//       if (value.isLoading) {
//         return const Center(
//           child: CircularProgressIndicator(
//             color: Colors.blue,
//           ),
//         );
//       }
//       final prices = value.prices;
//       List<BitcoinHistoricalPrice> filteredPrices =
//           prices.where((e) => e.usd > 1).toList();
//       List<FlSpot> formattedDataAll = filteredPrices
//           .map((e) => FlSpot(e.time.toDouble(), e.usd.toDouble()))
//           .toList();
//       List formattedDataArray = [
//         {
//           'name': "1W",
//           'data': formattedDataAll.sublist(0, 168),
//         },
//         {
//           'name': "1M",
//           'data': formattedDataAll.sublist(0, 720),
//         },
//         {
//           'name': "1YR",
//           'data': formattedDataAll.sublist(0, 8760),
//         },
//         {
//           'name': "ALL",
//           'data': formattedDataAll,
//         },
//       ];
//       return BitcoinLineChart2(formattedDataArray: formattedDataArray);
//     });
//   }
// }


