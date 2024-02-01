import 'dart:convert';
import 'package:bitcoin_demo_app/models/btc_price_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/btc_historical_price_model.dart';

class ApiService {
  Future<int> getBitcoinPriceFromMempool(http.Client client) async {
    const String url = "https://mempool.space/api/v1/prices";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final BitcoinPrice bitcoinPrice = BitcoinPrice(usd: json['USD']);
      debugPrint(
          "Bitcoin price from Mempool: ${bitcoinPrice.usd.toString()}\n${DateTime.now()}");
      return bitcoinPrice.usd.round();
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<int> getBitcoinPriceFromZBD(http.Client client) async {
    const String url = "https://api.zebedee.io/v0/btcusd";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final double btcUsdPrice = double.parse(json['data']['btcUsdPrice']);
      debugPrint(
          "Bitcoin price from ZBD: ${btcUsdPrice.toString()}\n${DateTime.now()}");
      return btcUsdPrice.round();
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<int> getBitcoinPriceFromCoinbase(http.Client client) async {
    const String url = "https://api.coinbase.com/v2/prices/BTC-USD/buy";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final double btcUsdPrice = double.parse(json['data']['amount']);
      debugPrint(
          "Bitcoin price from Coinbase: ${btcUsdPrice.toString()}\n${DateTime.now()}");
      return btcUsdPrice.round();
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<int> getBitcoinPriceFromGemeni(http.Client client) async {
    const String url = "https://api.gemini.com/v2/ticker/BTCUSD";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final double btcUsdPrice = double.parse(json['bid']!);
      debugPrint(
          "Bitcoin price from Gemeni: ${btcUsdPrice.toString()}\n${DateTime.now()}");
      return btcUsdPrice.round();
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<int> getBitcoinPriceFromCoindesk(http.Client client) async {
    const String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
    debugPrint("Status code: ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final double btcUsdPrice = json['bpi']['USD']['rate_float'].toDouble();
      debugPrint(
          "Bitcoin price from Coindesk: ${btcUsdPrice.toString()}\n${DateTime.now()}");
      return btcUsdPrice.round();
    }
    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<int> getBitcoinPrice(http.Client client) async {
      List<Future<int>> priceFutures = [];

      priceFutures.add(getBitcoinPriceFromMempool(client).catchError((e) => 0));
      priceFutures.add(getBitcoinPriceFromZBD(client).catchError((e) => 0));
      priceFutures
          .add(getBitcoinPriceFromCoinbase(client).catchError((e) => 0));
      priceFutures.add(getBitcoinPriceFromGemeni(client).catchError((e) => 0));
      priceFutures
          .add(getBitcoinPriceFromCoindesk(client).catchError((e) => 0));

      List<int?> prices = await Future.wait(priceFutures);

      prices = prices.where((price) => price != 0).toList();

      int averagePrice = prices.isNotEmpty
          ? (prices.reduce((sum, price) => sum! + price!)! / prices.length)
              .round()
          : 0;

    if(averagePrice == 0){
      return throw Exception();
    }

    return averagePrice;
  }

  Future<List<BitcoinHistoricalPrice>> getBitcoinHistoricalPrices(
      http.Client client) async {
    const String url = "https://mempool.space/api/v1/historical-price";
    final Uri uri = Uri.parse(url);

    final http.Response response = await client.get(uri);
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
