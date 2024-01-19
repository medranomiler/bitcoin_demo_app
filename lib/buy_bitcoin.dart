import "package:flutter/material.dart";
import 'preview_button.dart';

class BuyBitcoinPage extends StatefulWidget {
  const BuyBitcoinPage({super.key});

  @override
  State<BuyBitcoinPage> createState() => _BuyBitcoinPageState();
}

class _BuyBitcoinPageState extends State<BuyBitcoinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
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
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  enableSuggestions: true,
                  autocorrect: true,
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.left,
                  expands: false,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          "in Bitcoin",
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.w700, color: Colors.blue),
        ),
        PreviewButton()
      ]),
    );
  }
}
