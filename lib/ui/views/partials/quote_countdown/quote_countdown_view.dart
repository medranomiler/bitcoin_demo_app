import 'package:bitcoin_demo_app/ui/views/partials/quote_countdown/quote_countdown_viewmodel.dart';
import "package:flutter/material.dart";
import 'package:stacked/stacked.dart';

class QuoteProgressIndicatorView extends StatelessWidget {
  const QuoteProgressIndicatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteProgressIndicatorViewModel>.reactive(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: 16,
          height: 16,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.black),
            ),
            child: CircularProgressIndicator(
              value: model.data! / 10,
              backgroundColor: Colors.white,
              color: Colors.black,
              strokeWidth: 7,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => QuoteProgressIndicatorViewModel(),
    );
  }
}
