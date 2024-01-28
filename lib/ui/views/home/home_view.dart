import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/bitcoin_chart_view.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "BITCOIN PRICE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const BitcoinPriceStream(),
              const BitcoinChartView(),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ColoredBox(
                    color: Colors.blue.withOpacity(0.1),
                    child: Center(
                      child: MaterialButton(
                        color: Colors.black,
                        onPressed: () {
                          viewModel.navigateToBuyPage();
                        },
                        child: const Text(
                          "Buy Bitcoin",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
