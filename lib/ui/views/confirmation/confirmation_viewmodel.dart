import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/services/shared_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmationViewModel extends FutureViewModel {
  final _sharedDataService = locator<SharedDataService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<String> futureToRun() => getDataFromServer();

  Future<String> getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    return "done";
  }

  double? get sharedData => _sharedDataService.sharedData;

    formatBTC(bitcoinAmount) {
    return '${bitcoinAmount.toStringAsFixed(8)} BTC';
  }

  navigateToHomePage(){
    _navigationService.replaceWithHomeView();
  }
}
