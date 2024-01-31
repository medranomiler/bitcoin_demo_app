import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/buy/buy_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BuyViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
  });

  group('navigateToPreviewPage -', () {
    test(
        'When navigating to preview page, we should call navigation service with purchaseAmount',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = BuyViewModel();
      final purchaseAmount = 100;

      await model.navigateToPreviewPage(purchaseAmount);

      verify(navigationService.replaceWithPreviewView(
          purchaseAmount: purchaseAmount));
    });
  });

  group('goBack -', () {
    test('When going back, we should navigate to the home view', () async {
      final navigationService = getAndRegisterNavigationService();
      final model = BuyViewModel();

      await model.goBack();

      verify(navigationService.replaceWithHomeView());
    });
  });

  group('saveData -', () {
    test(
        'When form is valid, it should call navigation service with the parsed purchaseAmount',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = BuyViewModel();
      final purchaseAmount = '100';

      await model.saveData();

      verify(navigationService.replaceWithPreviewView(
          purchaseAmount: int.parse(purchaseAmount)));
    });

    test('When form is invalid, it should not call navigation service',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = BuyViewModel();
      final purchaseAmount = '0';

      await model.saveData();

      verifyNever(navigationService.replaceWithPreviewView(
          purchaseAmount: int.parse(purchaseAmount)));
    });
  });
}
