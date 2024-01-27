import 'package:flutter_test/flutter_test.dart';
import 'package:bitcoin_demo_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ErrorDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
