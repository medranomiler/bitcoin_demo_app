import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import "package:http/http.dart" as http;

class BitcoinPriceViewModel extends FutureViewModel<int> {
  final _bitcoinPriceService = locator<ApiService>();

  @override
  Future<int> futureToRun() => _bitcoinPriceService.getBitcoinPrice(http.Client());
}
