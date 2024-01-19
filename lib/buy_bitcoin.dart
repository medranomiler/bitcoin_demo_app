import 'dart:async';
import "package:flutter/material.dart";
import "package:bitcoin_demo_app/preview_buy.dart";
import "bitcoin_price_api.dart";

class BuyBitcoinPage extends StatefulWidget {
  const BuyBitcoinPage({Key? key}) : super(key: key);

  @override
  State<BuyBitcoinPage> createState() => _BuyBitcoinPageState();
}

class _BuyBitcoinPageState extends State<BuyBitcoinPage> {
  late Future<Album> futureAlbum;
   TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Text(
                "Buy \$",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: textFieldController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  enableSuggestions: true,
                  autocorrect: true,
                  style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.left,
                  expands: false,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            )
          ],
        ),
        const Text(
          "in Bitcoin",
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        SizedBox(
          height: 100,
            child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '1 BTC = \$${snapshot.data!.uSD.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                  style: const TextStyle(height: 1.5, fontSize: 18, color: Colors.blueGrey),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
        SizedBox(
          width: 240,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewBuyPage(
                      bitcoinPurchaseAmount: textFieldController.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Preview Buy')),
        ),
      ]),
    );
  }
}
