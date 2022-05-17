import 'package:flutter/cupertino.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/network_calls.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/shared%20components/containers/show_toast.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService _transactionService = TransactionService();

  List<TransactionModel> _userTransactions = [];

  TransactionModel? _selectedTransaction;

  bool _isInProgress = false;

  void setUserTransactions(List<TransactionModel> val) {
    _userTransactions = val;
  }

  void selectTransaction(TransactionModel val) {
    _selectedTransaction = val;
  }

  void switchProgress() {
    _isInProgress = !_isInProgress;
    notifyListeners();
  }

  List<TransactionModel> get userTransactions => _userTransactions;
  TransactionModel? get selectedTransaction => _selectedTransaction;
  bool get isInProgress => _isInProgress;

  ///Uses the Transaction Service to make a network request to the DB
  ///and saves the result to the provider state
  Future<bool> getTransactions() async {
    switchProgress();
    try {
      List<TransactionModel> _val =
          await _transactionService.getTransactionsFromDB();

      setUserTransactions(_val);
      switchProgress();
    } on Exception {
      switchProgress();
      showToast("A Network Error Occured");
    }

    notifyListeners();
    return true;
  }
}
