import 'dart:convert';

import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/network/constants.dart';
import 'package:renmoney_flutter_test/network/network_base.dart';
import 'package:renmoney_flutter_test/shared%20components/containers/show_toast.dart';

class TransactionService {
  ///Make a call to the API and cast the response into a Transaction Model List
  Future<List<TransactionModel>> getTransactionsFromDB(
      [NetworkRequests? networkRequests]) async {
    networkRequests ??= NetworkRequests();
    
      var response = await networkRequests.get(ApiConstants.url);

    var  responseMap = jsonDecode(response.body);
    

    return (responseMap!['data']['clientTransactions'] as List)
        .map((e) => TransactionModel.fromJson(e))
        .toList();
  }
}
