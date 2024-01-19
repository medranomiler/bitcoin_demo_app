import "package:flutter/material.dart";
import 'dart:async';
import "bitcoin_price_api.dart";

class PreviewBuyPage extends StatefulWidget {
  final String bitcoinPurchaseAmount;
  final String fees;
  final String total;
  const PreviewBuyPage({Key? key, required this.bitcoinPurchaseAmount, required this.fees, required this.total})
      : super(key: key);

  @override
  State<PreviewBuyPage> createState() => _PreviewBuyPageState();
}

class _PreviewBuyPageState extends State<PreviewBuyPage> {
  late Future<Album> futureAlbum;
  

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
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
                const Text(
                  "You're buying",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                ),
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                    double bitcoinAmount = double.parse(widget.bitcoinPurchaseAmount) / snapshot.data!.uSD;
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
                            '1 BTC = \$${snapshot.data!.uSD.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
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
                 Row(
                  children: [
                    const Expanded(child: Text("Purchase amount")),
                    Expanded(child: Text("\$ ${widget.bitcoinPurchaseAmount}", textAlign: TextAlign.right ,)),
                  ]
                ),
                                 Row(
                  children: [
                    const Expanded(child: Text("Fees")),
                    Expanded(child: Text("\$ ${widget.fees}", textAlign: TextAlign.right ,)),
                  ]
                ),
                Row(
                  children: [
                    const Expanded(child: Text("Total")),
                    Expanded(child: Text("\$ ${widget.total}", textAlign: TextAlign.right ,)),
                  ]
                ),
                 SizedBox(
          width: 240,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Confirm')),
        ),
              ],
            ),
          ),
        ));
  }
}
