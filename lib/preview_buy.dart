import "package:flutter/material.dart";

class PreviewBuyPage extends StatelessWidget {
  final String bitcoinPurchaseAmount;

  const PreviewBuyPage({Key? key, required this.bitcoinPurchaseAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        const Text("Preview Buy"),
        Text(bitcoinPurchaseAmount),
      ],)
    );
  }
}