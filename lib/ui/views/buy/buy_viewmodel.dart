import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/buy/buy_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();


  navigateToPreviewPage(purchaseAmount) {
    _navigationService.replaceWithPreviewView(purchaseAmount: purchaseAmount);
  }
  goBack(){
    _navigationService.replaceWithHomeView();
  }

    @override
  void setFormStatus() {
    // Set a validation message for the entire form
    if (hasPurchaseAmountValidationMessage) {
      setValidationMessage('Error in the form, please check again');
    }
  }

    Future<void> saveData() async {
    if (!isFormValid) return;

    // here we can run custom functionality to save to our api

     _navigationService.replaceWithPreviewView(purchaseAmount: int.parse(purchaseAmountValue!));
  }
}
