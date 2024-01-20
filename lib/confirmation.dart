import 'package:bitcoin_demo_app/main.dart';
import 'package:flutter/material.dart';
import "package:lottie/lottie.dart";

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
    var media = MediaQuery.of(context).size;
    var isSmallScreen = media.width < 390;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 4 : 8,),
          child: Column(
            children: [
               Text(
                "Size ${media.width} * ${media.height}",
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: isSmallScreen ? 36 : 48,
                  color: Colors.blue,
                ),
              ),
              Text(
                "You purchased\n${widget.bitcoinAmount} BTC",
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: isSmallScreen ? 20 : 24,
                  color: Colors.blue,
                ),
              ),
              Text(
                "at a price of \$${widget.bitcoinPurchasePrice.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: isSmallScreen ? 20 : 24,
                  color: Colors.blue,
                ),
              ),
              Text(
                "and paid \$${widget.total}",
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontSize: isSmallScreen ? 20 : 24,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RootPage(),
                    ), 
                    (route) =>
                        false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Done'),
              ),
              Lottie.asset('assets/bitcoin.json',
                width: isSmallScreen ? 300 : 400,
                height: isSmallScreen ? 300 : 400,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
