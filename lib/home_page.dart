import 'dart:async';
import 'package:flutter/material.dart';
import "buy_bitcoin.dart";
import 'bitcoin_chart.dart';
import "bitcoin_price_api.dart";


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
