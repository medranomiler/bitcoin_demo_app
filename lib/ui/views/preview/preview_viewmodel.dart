import 'package:stacked/stacked.dart';

class PreviewViewModel extends BaseViewModel {
  final int result;
  PreviewViewModel(this.result);

    calculateFees(purchaseAmount){
    double fees = purchaseAmount / 100;
    return "\$${fees.toString()}";
  }

    calculateTotal(purchaseAmount){
    double total = purchaseAmount + (purchaseAmount / 100);
    return "\$${total.toString()}";
  }
}
