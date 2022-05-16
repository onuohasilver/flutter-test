import 'package:flutter_test/flutter_test.dart';

import 'models.dart';
import 'network.dart';

void main() {
  group("Transaction Tests", () {
    fetchDataTest();
    mapToTransactionTest();
  });
}
