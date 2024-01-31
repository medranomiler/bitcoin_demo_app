import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
  });

  group('navigateToBuyPage -', () {
    test(
        'When the buy bitcoin button is pressed, we should navigate to the buy view',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = HomeViewModel();
      await model.navigateToBuyPage();

      verify(navigationService.replaceWithBuyView());
    });
  });
}
