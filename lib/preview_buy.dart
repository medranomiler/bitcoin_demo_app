import 'package:flutter/material.dart';
import 'bitcoin_price_api.dart';
import 'confirmation.dart';
import "progress_indicator.dart";
import 'dart:async';

class PreviewBuyPage extends StatefulWidget {
  final String bitcoinPurchaseAmount;
  final String fees;
  final String total;

  const PreviewBuyPage({
    Key? key,
    required this.bitcoinPurchaseAmount,
    required this.fees,
    required this.total,
  }) : super(key: key);

  @override
  State<PreviewBuyPage> createState() => _PreviewBuyPageState();
}

class _PreviewBuyPageState extends State<PreviewBuyPage> {
  late Timer timer;
  late int btcPriceApiResponse = 0;
  late double bitcoinAmount = 0;
  late String bitcoinPurchasePrice = '';
  late int countdown;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchBitcoinPrice().then((data) {
      setState(() {
        btcPriceApiResponse = data;
        bitcoinAmount =
            double.parse(widget.bitcoinPurchaseAmount) / btcPriceApiResponse;
        bitcoinPurchasePrice = btcPriceApiResponse.toStringAsFixed(2);
      });
    });
    countdown = 60;

    timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
      fetchBitcoinPrice().then((data) {
        setState(() {
          btcPriceApiResponse = data;
          bitcoinAmount =
              double.parse(widget.bitcoinPurchaseAmount) / btcPriceApiResponse;
          bitcoinPurchasePrice = btcPriceApiResponse.toStringAsFixed(2);
          countdown = 60;
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
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const QuoteProgressIndicator(),
              const Text(
                "You're buying",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
              FutureBuilder<int>(
                future: fetchBitcoinPrice(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          '${bitcoinAmount.toStringAsFixed(8)} BTC',
                          style: const TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '1 BTC = \$${btcPriceApiResponse.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          style: const TextStyle(
                              height: 1.5,
                              fontSize: 18,
                              color: Colors.blueGrey),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              Row(children: [
                const Expanded(child: Text("Purchase amount")),
                Expanded(
                  child: Text(
                    "\$ ${widget.bitcoinPurchaseAmount}",
                    textAlign: TextAlign.right,
                  ),
                ),
              ]),
              Row(children: [
                const Expanded(child: Text("Fees")),
                Expanded(
                  child: Text(
                    "\$ ${widget.fees}",
                    textAlign: TextAlign.right,
                  ),
                ),
              ]),
              Row(children: [
                const Expanded(child: Text("Total")),
                Expanded(
                  child: Text(
                    "\$ ${widget.total}",
                    textAlign: TextAlign.right,
                  ),
                ),
              ]),
              // Simulating network call
              SizedBox(
                  width: 24,
                  height: 24,
                  child: isLoading ? const CircularProgressIndicator() : null),
              SizedBox(
                width: 240,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      Timer.periodic(const Duration(seconds: 2), (Timer t) {
                        setState(() {
                          isLoading = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmationPage(
                                total: widget.total,
                                bitcoinAmount: bitcoinAmount.toStringAsFixed(8),
                                bitcoinPurchasePrice: bitcoinPurchasePrice,
                              ),
                            ),
                          );
                          t.cancel();
                        });
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
