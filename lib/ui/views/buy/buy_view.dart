import 'package:bitcoin_demo_app/ui/common/app_colors.dart';
import 'package:bitcoin_demo_app/ui/views/buy/buy_view.form.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'buy_viewmodel.dart';

class BuyView extends StatelessWidget with $BuyView {
  BuyView({Key? key}) : super(key: key);

  static const TextStyle textStyle =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w700, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyViewModel>.reactive(
      onViewModelReady: (viewModel) {
        // #3: Listen to text updates by calling listenToFormUpdated(model);
        syncFormWithViewModel(viewModel);
      },
      onDispose: (model) => disposeForm(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: Column(
              children: [
                const BitcoinPriceStream(),
                TextFormField(
                  key: const ValueKey('purchaseAmount'),
                  controller: purchaseAmountController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  showCursor: false,
                  enableSuggestions: true,
                  expands: false,
                  focusNode: purchaseAmountFocusNode,
                  style: textStyle,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    prefixStyle: textStyle,
                    prefixText: "Buy \$",
                    hintText:
                        String.fromEnvironment("100", defaultValue: "100"),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    counterText: "",
                  ),
                  onFieldSubmitted: (_) => viewModel.saveData(),
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
                            Text("Checking Account ****0555",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            Text("Limit of \$1,0000",
                                style: TextStyle(color: kcMediumGrey))
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
                          viewModel.saveData();
                        },
                        child: const Text(
                          "Preview Buy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (viewModel.hasPurchaseAmountValidationMessage) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              viewModel.purchaseAmountValidationMessage ?? '',
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                            duration: const Duration(milliseconds: 1500),
                          ),
                        );
                      });
                    }
                    return const SizedBox
                        .shrink(); // Return a placeholder widget if needed
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => BuyViewModel(),
    );
  }
}
