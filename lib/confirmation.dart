import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  final String total;
  final String bitcoinAmount;
  final String bitcoinPurchasePrice;

  const ConfirmationPage(
      {Key? key,
      required this.total,
      required this.bitcoinAmount,
      required this.bitcoinPurchasePrice})
      : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Success!",
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                  color: Colors.blue,
                ),
              ),
              Text(
                "You purchased\n${widget.bitcoinAmount} BTC",
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              Text(
                "at a price of \$${widget.bitcoinPurchasePrice.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              Text(
                "and paid \$${widget.total}",
                style: const TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
