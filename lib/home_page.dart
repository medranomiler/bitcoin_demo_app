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
  late int btcPriceApiResponse = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    fetchBitcoinPrice().then((data) {
      setState(() {
        btcPriceApiResponse = data;
      });
    });

    timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
      fetchBitcoinPrice().then((data) {
        setState(() {
          btcPriceApiResponse = data;
        });
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      backgroundColor: Colors.blue.withOpacity(0.1),
      body: Column(children: [
         SizedBox(
          width: double.infinity,
          child: ColoredBox(
            color: Colors.white,
            child: Column(
            
            children: [
              const Text(
                'BITCOIN PRICE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FutureBuilder<int>(
          future: fetchBitcoinPrice(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  '\$${btcPriceApiResponse.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, height: 1.5, fontSize: 48));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
            ],
          ),
          ),
        ),
        
        const ColoredBox(
          color: Colors.white,
          child: BitcoinLineChart(),
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
            child: const Text('Buy Bitcoin'),
          ),
        )
      ]),
    );
  }
}
