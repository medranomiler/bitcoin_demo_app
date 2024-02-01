import 'package:bitcoin_demo_app/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  group('ApiServiceTest -', () {
    test('getBitcoinPrice - Successful response', () async {
      final client = MockClient();

      when(client.get(Uri.parse("https://mempool.space/api/v1/prices")))
          .thenAnswer((_) async => http.Response('{"USD": 50000}', 200));

      final apiService = ApiService();

      final result = await apiService.getBitcoinPrice(client);

      verify(client.get(Uri.parse("https://mempool.space/api/v1/prices")));

      expect(result, 50000);
    });

    test('getBitcoinPrice - Error response', () async {
      final client = MockClient();

      when(client.get(Uri.parse("https://mempool.space/api/v1/prices")))
          .thenAnswer((_) async => http.Response('Error', 404));

      final apiService = ApiService();

      expect(() => apiService.getBitcoinPrice(client), throwsException);
    });

    test('getBitcoinHistoricalPrices - Successful response', () async {
      final client = MockClient();

      when(client.get(Uri.parse("https://mempool.space/api/v1/historical-price")))
          .thenAnswer((_) async => http.Response('{"prices": [{"time": 1, "USD": 50000}]}', 200));

      final apiService = ApiService();

      final result = await apiService.getBitcoinHistoricalPrices(client);

      verify(client.get(Uri.parse("https://mempool.space/api/v1/historical-price")));

      expect(result.length, 1);
      expect(result[0].time, 1);
      expect(result[0].usd, 50000);
    });

    test('getBitcoinHistoricalPrices - Error response', () async {
      final client = MockClient();

      when(client.get(Uri.parse("https://mempool.space/api/v1/historical-price")))
          .thenAnswer((_) async => http.Response('Error', 404));

      final apiService = ApiService();

      expect(() => apiService.getBitcoinHistoricalPrices(client), throwsException);
    });
  });
}
