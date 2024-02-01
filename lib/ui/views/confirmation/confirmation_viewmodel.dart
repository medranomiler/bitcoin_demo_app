import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/services/shared_data_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmationViewModel extends FutureViewModel {
  final _sharedDataService = locator<SharedDataService>();
  final _navigationService = locator<NavigationService>();

  TextStyle textStyle0 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
  TextStyle textStyle1 =
      const TextStyle(fontSize: 40, fontWeight: FontWeight.w700);

  @override
  Future<String> futureToRun() => delayUIDisplay();

  Future<String> delayUIDisplay() async {
    await Future.delayed(const Duration(seconds: 2));
    return "";
  }

  double? get sharedData => _sharedDataService.sharedData;

  formatBTC(bitcoinAmount) {
    return '${bitcoinAmount.toStringAsFixed(8)} BTC';
  }

  navigateToHomePage() {
    _navigationService.replaceWithHomeView();
  }
}
