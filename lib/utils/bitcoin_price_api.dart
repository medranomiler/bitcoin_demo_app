// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<int> fetchBitcoinPrice() async {
//   debugPrint("fetching btc price data from mempool.space");
//   final response =
//       await http.get(Uri.parse('https://mempool.space/api/v1/prices'));
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = json.decode(response.body);

//     return data['USD'];
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// class BitcoinPriceData {
//   final String time;
//   final String usd;

//   BitcoinPriceData({required this.time, required this.usd});

//   factory BitcoinPriceData.fromJson(Map<String, dynamic> json) {
//     return BitcoinPriceData(
//       time: json['time'].toString(),
//       usd: json['USD'].toString(),
//     );
//   }
// }

// Future<List<BitcoinPriceData>> fetchHistoricalBitcoinPriceData() async {
//   try {
//     final response = await http
//         .get(Uri.parse('https://mempool.space/api/v1/historical-price'));

//     if (response.statusCode == 200) {
//       List<dynamic> prices = json.decode(response.body)['prices'];

//       List<BitcoinPriceData> bitcoinPriceDataList = prices.map((json) {
//         return BitcoinPriceData.fromJson(json);
//       }).toList();
//       debugPrint(bitcoinPriceDataList.toString());
//       return bitcoinPriceDataList;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   } catch (error) {
//     throw Exception('Error: $error');
//   }
// }
