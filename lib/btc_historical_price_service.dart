import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'btc_historical_price_model.dart';

class BitcoinHistoricalPriceService {
  Future<List<BitcoinHistoricalPrice>> getBitcoinHistoricalPrices() async {
    const String url = "https://mempool.space/api/v1/historical-price";
    final Uri uri = Uri.parse(url);

    try{
      final http.Response response = await http.get(uri);
      debugPrint("<btc_hstorical_price_provider>Status code: ${response.statusCode.toString()}");

      if(response.statusCode == 200){
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> pricesData = json['prices'];
        final prices = pricesData.map((e){
          return BitcoinHistoricalPrice(
            time: (e['time'] ?? 0).toInt(),
            usd: (e['USD'] ?? 0).toInt()
          );
        }).toList();
        return prices;
      }
      return [];
    }catch(error){
      debugPrint("Error <btc_hstorical_price_provider>: $error");
      return[];
    }
  }
}