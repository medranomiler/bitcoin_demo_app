import 'dart:async';

import 'package:bitcoin_demo_app/app/app.dialogs.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';
import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_price/bitcoin_price_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class MockApiService extends Mock implements ApiService {}

class MockNavigationService extends Mock implements NavigationService {}

class MockDialogService extends Mock implements DialogService {}

void main() {
  group('BitcoinPriceStreamModelTest -', () {
    late MockApiService apiService;
    late MockNavigationService navigationService;
    late MockDialogService dialogService;

    setUp(() {
      apiService = MockApiService();
      navigationService = MockNavigationService();
      dialogService = MockDialogService();

      locator.registerSingleton<ApiService>(apiService);
      locator.registerSingleton<NavigationService>(navigationService);
      locator.registerSingleton<DialogService>(dialogService);
    });

    tearDown(() {
      locator.unregister<ApiService>();
      locator.unregister<NavigationService>();
      locator.unregister<DialogService>();
    });

    test('Should emit bitcoin prices from getBitcoinPrice', () async {
      final model = BitcoinPriceStreamModel();

      when(apiService.getBitcoinPrice()).thenAnswer((_) async => 100);

      final result = await model.stream.first;

      verify(apiService.getBitcoinPrice());
      expect(result, 100);
    });

    test('Should emit delayed bitcoin prices from getDelayedBitcoinPrice', () async {
      final model = BitcoinPriceStreamModel();

      when(apiService.getBitcoinPrice()).thenAnswer((_) async => 100);

      final result = await model.stream.take(2).toList();

      verifyNever(apiService.getBitcoinPrice());
      expect(result, [null, 100]); 
    });

    test('Should format price correctly', () {
      final model = BitcoinPriceStreamModel();
      final formattedPrice = model.formatPrice(1000000);

      expect(formattedPrice, '\$1,000,000');
    });

    test('Should call onCancel when stream is canceled', () async {
      final model = BitcoinPriceStreamModel();

      await model.streamSubscription!.cancel();

      verify(model.onCancel());
    });

    test('Should show error dialog and navigate to home view on error', () async {
      final model = BitcoinPriceStreamModel();

      when(apiService.getBitcoinPrice()).thenThrow(Exception());

      await model.stream.first;

      verify(model.onError(any));

      // Verify that the error dialog is shown
      verify(dialogService.showCustomDialog(
        variant: DialogType.error,
        title: "Error",
        description: 'Error obtaining bitcoin price data.',
        mainButtonTitle: "Try Again",
      ));

      verify(navigationService.replaceWithHomeView());
    });
  });
}
