import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/models/btc_historical_price_model.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:stacked/stacked.dart';


class HomeViewModel extends FutureViewModel<List<BitcoinHistoricalPrice>>{
    final _apiService = locator<ApiService>();
  
  @override
  // Future<int> futureToRun() => _apiService.getBitcoinPrice();
  Future<List<BitcoinHistoricalPrice>> futureToRun() => _apiService.getBitcoinHistoricalPrices();
  
  @override
    void onError(error) {
      super.onError(error);
      throw Exception(error);
    }
}
