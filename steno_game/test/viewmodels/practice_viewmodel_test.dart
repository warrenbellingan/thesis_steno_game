import 'package:flutter_test/flutter_test.dart';
import 'package:steno_game/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PracticeViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
