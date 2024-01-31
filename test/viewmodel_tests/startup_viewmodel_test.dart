import 'package:bitcoin_demo_app/app/app.router.dart';
import 'package:bitcoin_demo_app/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
  });

  group('runStartupLogic -', () {
    test(
        'When the future delay duration ends, we should navigate to the home view',
        () async {
      final navigationService = getAndRegisterNavigationService();
      final model = StartupViewModel();
      await model.runStartupLogic();

      verify(navigationService.replaceWithHomeView());
    });
  });
}
