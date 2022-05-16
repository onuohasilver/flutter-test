import 'package:flutter/cupertino.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/network_calls.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService _transactionService = TransactionService();

  List<TransactionModel>? _userTransactions;

  void setUserTransactions(List<TransactionModel> val) {
    _userTransactions = val;
  }

  List<TransactionModel>? get userTransactions => _userTransactions;

  ///Uses the Transaction Service to make a network request to the DB
  ///and saves the result to the provider state
  Future<void> getTransactions() async {
    List<TransactionModel> _val =
        await _transactionService.getTransactionsFromDB();
    setUserTransactions(_val);
    notifyListeners();
  }
}
