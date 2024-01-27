import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToPreviewPage(arg) {
    _navigationService.navigateToPreviewView(result: arg);
  }
  goBack(){
    _navigationService.back();
  }
}