import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'btc_price_model.dart';

class BitcoinPriceService {
  Future<int> getBitcoinPrice() async {
    const String url = "https://mempool.space/api/v1/prices";
    final Uri uri = Uri.parse(url);

    try {
      final http.Response response = await http.get(uri);
      debugPrint("Status code: ${response.statusCode.toString()}");

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        final BitcoinPrice bitcoinPrice = BitcoinPrice(usd: json['USD']);
        debugPrint("Bitcoin price: ${bitcoinPrice.usd.toString()}\n${DateTime.now()}");
        return bitcoinPrice.usd;
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
    return 777;
  }
}