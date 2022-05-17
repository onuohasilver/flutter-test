import 'package:flutter_test/flutter_test.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_service.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/modules/transactions/utitlities/utitlities.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/transaction_icon_widget.dart';
import 'package:renmoney_flutter_test/network/network_base.dart';

import 'mock_client.dart';

mapToTransactionTest() {
  test('Test Transaction Type Mapping', () async {
    List<TransactionModel> transactions = await TransactionService()
        .getTransactionsFromDB(NetworkRequests(mockHTTPClientSuccess));
    expect(getTransactionType(transactions[0].type!), isA<TransactionType>());
  });

  test('Get IconType', () async {
    List<TransactionModel> transactions = await TransactionService()
        .getTransactionsFromDB(NetworkRequests(mockHTTPClientSuccess));
    expect(getIconByType(transactions[0].type!), isA<IconWidgetData>());
  });
}
