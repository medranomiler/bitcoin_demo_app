import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/dialogs/error/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PreviewViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();

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
      description: "Click the confirm button to submit your bitcoin purchase order.",
      confirmButtonTitle: "Confirm",
      cancelButtonTitle: "Cancel",
    );

    if (!response!.confirmed) {
      return _dialogService.showDialog(
        title: "Order Cancelled",
        description: "Your bitcoin purchase order was cancelled.",
      );
    }
    _navigationService.replaceWithConfirmationView(
      purchaseAmount: purchaseAmount,
    );
  }
}
