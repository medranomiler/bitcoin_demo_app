import 'package:bitcoin_demo_app/buy_bitcoin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
        child: const Text("Buy Bitcoin"),
      ),
    );
  }
}
