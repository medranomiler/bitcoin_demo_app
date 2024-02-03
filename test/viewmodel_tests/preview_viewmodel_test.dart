// ignore_for_file: unused_local_variable

import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/preview/preview_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PreviewViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
  });

  group('formatPurchaseAmount -', () {
    test('Should format purchase amount correctly', () {
      final navigationService = getAndRegisterNavigationService();
      final bottomSheetService = getAndRegisterBottomSheetService();
      final dialogService = getAndRegisterDialogService();
      final model = PreviewViewModel(100);
      final formattedAmount = model.formatPurchaseAmount(100);

      expect(formattedAmount, '\$100.00');
    });
  });

  group('calculateFees -', () {
    test('Should calculate fees correctly', () {
      final navigationService = getAndRegisterNavigationService();
      final bottomSheetService = getAndRegisterBottomSheetService();
      final dialogService = getAndRegisterDialogService();
      final model = PreviewViewModel(100);
      final fees = model.calculateFees(100);

      expect(fees, '\$1.00');
    });
  });

  group('calculateTotal -', () {
    test('Should calculate total correctly', () {
      final navigationService = getAndRegisterNavigationService();
      final bottomSheetService = getAndRegisterBottomSheetService();
      final dialogService = getAndRegisterDialogService();
      final model = PreviewViewModel(100);
      final total = model.calculateTotal(100);

      expect(total, '\$101.00');
    });
  });

  group('goBack -', () {
    test('When going back, we should navigate to the buy view', () async {
      final navigationService = getAndRegisterNavigationService();
      final bottomSheetService = getAndRegisterBottomSheetService();
      final dialogService = getAndRegisterDialogService();
      final model = PreviewViewModel(100);

      await model.goBack();

      verify(navigationService.replaceWithBuyView());
    });
  });

  group('navigateToConfirmPage -', () {
    test('When confirming purchase, we should navigate to confirmation view',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final bottomSheetService = getAndRegisterBottomSheetService();
      final dialogService = getAndRegisterDialogService();
      final model = PreviewViewModel(100);

      when(bottomSheetService.showBottomSheet(
        title: anyNamed('title'),
        description: anyNamed('description'),
        confirmButtonTitle: anyNamed('confirmButtonTitle'),
        cancelButtonTitle: anyNamed('cancelButtonTitle'),
      )).thenAnswer((_) async => SheetResponse(confirmed: true));

      await model.navigateToConfirmPage(100);

      verify(
          navigationService.replaceWithConfirmationView(purchaseAmount: 100));
    });
  });
}
