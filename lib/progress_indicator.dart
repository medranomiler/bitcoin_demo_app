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
      if(countdown == 0){
                setState(() {
          countdown = 60;
        });
      }
    });

    countdown = 60;
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double progress = countdown / 60.0;

    return CircularProgressIndicator(
                value: progress,
                color: Colors.blue,
              );
  }
}