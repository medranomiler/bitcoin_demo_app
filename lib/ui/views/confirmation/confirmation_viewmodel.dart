import 'package:bitcoin_demo_app/services/shared_service.dart';
import 'package:stacked/stacked.dart';

class ConfirmationViewModel extends BaseViewModel {
  final _sharedDataService = SharedDataService();

  double? get sharedData => _sharedDataService.sharedData;

    formatBTC(bitcoinAmount) {
    return '${bitcoinAmount.toStringAsFixed(8)} BTC';
  }

}
