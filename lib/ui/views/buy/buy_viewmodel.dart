import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/buy/buy_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToPreviewPage(purchaseAmount) {
    _navigationService.replaceWithPreviewView(purchaseAmount: purchaseAmount);
  }

  goBack() {
    _navigationService.replaceWithHomeView();
  }

  @override
  void setFormStatus() {
    if (hasPurchaseAmountValidationMessage) {
      setValidationMessage('Error in the form, please check again');
    }
  }

  Future<void> saveData() async {
    if (!isFormValid) return;
    _navigationService.replaceWithPreviewView(
        purchaseAmount: int.parse(purchaseAmountValue!));
  }

  TextStyle textStyle = const TextStyle(
      fontSize: 48, fontWeight: FontWeight.w700, color: Colors.black);
}
