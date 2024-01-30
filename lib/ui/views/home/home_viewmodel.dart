import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  
  navigateToBuyPage(){
    _navigationService.replaceWithBuyView();
  }

  
}
