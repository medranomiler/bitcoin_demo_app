import 'package:bitcoin_demo_app/providers/btc_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "buy_bitcoin.dart";
import '../widgets/chart_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          const Text(
            "BITCOIN PRICE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Consumer<BitcoinPriceProvider>(builder: (context, value, child) {
            return Text(
              "\$${value.bitcoinPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            );
          }),
          const ChartContainer(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ColoredBox(
                color: Colors.blue.withOpacity(0.1),
                child: Center(
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
