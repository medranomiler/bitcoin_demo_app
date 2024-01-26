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
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: BitcoinPriceStream()
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
// Center(
//             child: viewModel.isBusy
//                 ? const CircularProgressIndicator()
//                 : ListView.builder(
//                     itemCount: viewModel.data?.length,
//                     itemBuilder: (context, index) {
//                       final price = viewModel.data?[index];
//                       return Card(
//                         child: ListTile(
//                           title: Text(price!.usd.toString()),
//                         ),
//                       );
//                     },
//                   ),
//           ),