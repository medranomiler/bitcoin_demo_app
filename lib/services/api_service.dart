import 'dart:convert';
import 'package:bitcoin_demo_app/models/btc_price_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/btc_historical_price_model.dart';

class ApiService {
  Future<int> getBitcoinPrice() async {
    const String url = "https://mempool.space/api/v1/prices";
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final BitcoinPrice bitcoinPrice = BitcoinPrice(usd: json['USD']);
      debugPrint(
          "Bitcoin price: ${bitcoinPrice.usd.toString()}\n${DateTime.now()}");
      return bitcoinPrice.usd;
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<List<BitcoinHistoricalPrice>> getBitcoinHistoricalPrices() async {
    const String url = "https://mempool.space/api/v1/historical-price";
    final Uri uri = Uri.parse(url);

      final http.Response response = await http.get(uri);
      debugPrint(
          "<btc_hstorical_price_provider>Status code: ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> pricesData = json['prices'];
        final prices = pricesData.map((e) {
          return BitcoinHistoricalPrice(
              time: (e['time'] ?? 0).toInt(), usd: (e['USD'] ?? 0).toInt());
        }).toList();
        return prices;
      }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }
}


