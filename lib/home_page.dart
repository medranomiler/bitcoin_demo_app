import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "buy_bitcoin.dart";
import 'bitcoin_chart.dart';

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://mempool.space/api/v1/prices'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load bitcoin price');
  }
}

class Album {
  final int time;
  final int uSD;
  final int eUR;
  final int gBP;
  final int cAD;
  final int cHF;
  final int aUD;
  final int jPY;

  const Album({
    required this.time,
    required this.uSD,
    required this.eUR,
    required this.gBP,
    required this.cAD,
    required this.cHF,
    required this.aUD,
    required this.jPY,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'time': int time,
        'USD': int uSD,
        'EUR': int eUR,
        'GBP': int gBP,
        'CAD': int cAD,
        'CHF': int cHF,
        'AUD': int aUD,
        'JPY': int jPY,
      } =>
        Album(
          time: time,
          uSD: uSD,
          eUR: eUR,
          gBP: gBP,
          cAD: cAD,
          cHF: cHF,
          aUD: aUD,
          jPY: jPY,
        ),
      _ => throw const FormatException('Failed to load bitcoin price.'),
    };
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Center(
          child: Text(
            'BITCOIN PRICE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  '\$${snapshot.data!.uSD.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, height: 1.5, fontSize: 48));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        const SizedBox(
          height: 300,
          child: 
        BitcoinLineChart(),
        ),
        SizedBox(
          width: 240,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const BuyBitcoinPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Buy Bitcoin')),
        )
      ]),
    );
  }
}
