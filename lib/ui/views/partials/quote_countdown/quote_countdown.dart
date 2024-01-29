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

    return SizedBox(
      width: 20,
      height: 20,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 6, color: Colors.black)),
        child: CircularProgressIndicator(
          value: progress,
          backgroundColor: Colors.black,
          color: Colors.white,
          strokeWidth: 8,
        ),
      ),
    );
  }
}
