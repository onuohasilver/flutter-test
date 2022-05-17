import 'package:flutter_test/flutter_test.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_service.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/network/network_base.dart';

import 'mock_client.dart';

fetchDataTest() {
  test(
    'Test network requests',
    () async {
      expect(
          await TransactionService()
              .getTransactionsFromDB(NetworkRequests(mockHTTPClientSuccess)),
          isA<List<TransactionModel>>());
    },
  );
  test('On Failure', () async {
    expect(
        () async => await TransactionService()
            .getTransactionsFromDB(NetworkRequests(mockHTTPClientFailure)),
        throwsA(isA<Exception>()));
  });
}
