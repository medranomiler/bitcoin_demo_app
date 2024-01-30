import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PreviewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  final int purchaseAmount;
  PreviewViewModel(this.purchaseAmount);

  formatPurchaseAmount(purchaseAmount) {
    return "\$${purchaseAmount.toString()}.00";
  }

  calculateFees(purchaseAmount) {
    double fees = purchaseAmount / 100;
    return "\$${fees.toString()}";
  }

  calculateTotal(purchaseAmount) {
    double total = purchaseAmount + (purchaseAmount / 100);
    return "\$${total.toString()}";
  }

  goBack() {
    _navigationService.replaceWithBuyView();
  }

  navigateToConfirmPage(purchaseAmount) async {
    var response = await _bottomSheetService.showBottomSheet(
        title: "Confirm Purchase",
        description: "Click confirm if you want to submit your buy order.",
        confirmButtonTitle: "Confirm",
        cancelButtonTitle: "Cancel",
        
        );

    if (response!.confirmed) {
      _navigationService.replaceWithConfirmationView(
        purchaseAmount: purchaseAmount,
      );
    }
  }
}
