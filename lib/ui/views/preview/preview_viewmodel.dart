import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PreviewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  
  final int result;
  PreviewViewModel(this.result);
  

    formatPurchaseAmount(purchaseAmount){
      return "\$${purchaseAmount.toString()}.00";
    }

    calculateFees(purchaseAmount){
    double fees = purchaseAmount / 100;
    return "\$${fees.toString()}";
  }

    calculateTotal(purchaseAmount){
    double total = purchaseAmount + (purchaseAmount / 100);
    return "\$${total.toString()}";
  }

  navigateToConfirmPage(){
    _navigationService.navigateToConfirmationView();
  }

}
