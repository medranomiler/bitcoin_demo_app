import "package:flutter/material.dart";

class BuyBitcoinPage extends StatefulWidget {
  const BuyBitcoinPage({super.key});

  @override
  State<BuyBitcoinPage> createState() => _BuyBitcoinPageState();
}

class _BuyBitcoinPageState extends State<BuyBitcoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitcoin"),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.black),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text("This is a text widget"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("elevated button pressed");
            },
            child: const Text("Elevated Button"),
          ),
        ],
      ),
    );
  }
}
