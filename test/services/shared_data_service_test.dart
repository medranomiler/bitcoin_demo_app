import 'package:bitcoin_demo_app/services/shared_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SharedDataServiceTest -', () {
    test('Should return null for sharedData if not set', () {
      final sharedDataService = SharedDataService();

      final result = sharedDataService.sharedData;

      expect(result, isNull);
    });

    test('Should set and get sharedData correctly', () {
      final sharedDataService = SharedDataService();

      sharedDataService.sharedData = 10.0;

      final result = sharedDataService.sharedData;

      expect(result, 10.0);
    });

    test('Should maintain a single instance using the singleton pattern', () {
      final sharedDataService1 = SharedDataService();
      final sharedDataService2 = SharedDataService();

      expect(identical(sharedDataService1, sharedDataService2), isTrue);
    });
  });
}
