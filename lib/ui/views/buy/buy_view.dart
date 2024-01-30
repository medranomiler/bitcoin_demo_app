import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'buy_viewmodel.dart';

class BuyView extends StackedView<BuyViewModel> {
  BuyView({Key? key}) : super(key: key);

  TextEditingController textFieldController = TextEditingController();
  static const TextStyle textStyle =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.black);
  @override
  Widget builder(
    BuildContext context,
    BuyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          child: Column(
            children: [
              const Text(
                "BITCOIN PRICE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const BitcoinPriceStream(),
              TextField(
                controller: textFieldController,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                showCursor: false,
                enableSuggestions: true,
                autocorrect: true,
                style: textStyle,
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.left,
                expands: false,
                decoration: const InputDecoration(
                  prefix: Text("Buy \$"),
                  prefixStyle: textStyle,
                  hintText: String.fromEnvironment("100", defaultValue: "100"),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  counterText: "",
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "in Bitcoin",
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Checking Account ****0555"),
                          Text("Limit of \$1,0000")
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        viewModel.goBack();
                      },
                      child: const Text(
                        "back",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        viewModel.navigateToPreviewPage(
                            int.parse(textFieldController.text));
                      },
                      child: const Text(
                        "Preview Buy",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  BuyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BuyViewModel();
}
