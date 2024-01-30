import "package:flutter/material.dart";
import 'dart:async';

class QuoteProgressIndicator extends StatefulWidget {
  const QuoteProgressIndicator({super.key});

  @override
  State<QuoteProgressIndicator> createState() => _QuoteProgressIndicatorState();
}

class _QuoteProgressIndicatorState extends State<QuoteProgressIndicator> {
  late Timer timer;
  late int countdown;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      }
      if (countdown == 0) {
        setState(() {
          countdown = 10;
        });
      }
    });

    countdown = 10;
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = countdown / 10;

    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 16,
        height: 16,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.black)),
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            color: Colors.black,
            strokeWidth: 7,
          ),
        ),
      ),
    );
  }
}
