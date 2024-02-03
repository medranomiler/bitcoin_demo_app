// ignore_for_file: unused_local_variable

import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/confirmation/confirmation_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ConfirmationViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
  });

  group('futureToRun -', () {
    test('Should return an empty string after delay', () async {
      final sharedDataService = getAndRegisterSharedDataService();
      final navigationService = getAndRegisterNavigationService();
      final model = ConfirmationViewModel();

      final result = await model.futureToRun();

      expect(result, '');
    });
  });

  group('delayUIDisplay -', () {
    test('Should delay UI display by 2 seconds', () async {
      final sharedDataService = getAndRegisterSharedDataService();
      final navigationService = getAndRegisterNavigationService();
      final model = ConfirmationViewModel();
      final startTime = DateTime.now();

      await model.delayUIDisplay();

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      expect(duration.inSeconds, 2);
    });
  });

  group('sharedData -', () {
    test('Should get sharedData from SharedDataService', () {
      final sharedDataService = getAndRegisterSharedDataService();
      final navigationService = getAndRegisterNavigationService();
      final model = ConfirmationViewModel();

      when(sharedDataService.sharedData).thenReturn(10.0);

      final result = model.sharedData;

      expect(result, 10.0);
    });
  });

  group('formatBTC -', () {
    test('Should format bitcoin amount correctly', () {
      final sharedDataService = getAndRegisterSharedDataService();
      final navigationService = getAndRegisterNavigationService();
      final model = ConfirmationViewModel();
      final formattedBTC = model.formatBTC(0.12345678);

      expect(formattedBTC, '0.12345678 BTC');
    });
  });

  group('navigateToHomePage -', () {
    test('Should navigate to the home view', () async {
      final sharedDataService = getAndRegisterSharedDataService();
      final navigationService = getAndRegisterNavigationService();
      final model = ConfirmationViewModel();

      await model.navigateToHomePage();

      verify(navigationService.replaceWithHomeView());
    });
  });
}
