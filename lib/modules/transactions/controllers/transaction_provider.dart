import 'package:flutter/cupertino.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_service.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/shared%20components/containers/show_toast.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService _transactionService = TransactionService();

  List<TransactionModel> _userTransactions = [];

  TransactionModel? _selectedTransaction;

  bool _isInProgress = false;
  bool _hasError = false;

  ///Load user transactions into the provider state object
  void setUserTransactions(List<TransactionModel> val) {
    _userTransactions = val;
  }

  ///Select a single transaction
  ///and load it into the provider state object
  void selectTransaction(TransactionModel val) {
    _selectedTransaction = val;
  }

  ///toggles the progress status of
  ///an operation
  void switchProgress() {
    _isInProgress = !_isInProgress;
    notifyListeners();
  }

  ///Sets the error state of the last request
  void _setError(bool val) {
    _hasError = val;
    notifyListeners();
  }

  ///All the transactions by the user
  List<TransactionModel> get userTransactions => _userTransactions;

  ///The currently selected transaction
  TransactionModel? get selectedTransaction => _selectedTransaction;

  ///The progress status of an operation
  bool get isInProgress => _isInProgress;

  ///Get the error state of the last request
  bool get hasError => _hasError;

  ///Uses the Transaction Service to make a network request to the DB
  ///and saves the result to the provider state
  Future<bool> getTransactions() async {
    _setError(false);
    switchProgress();
    try {
      List<TransactionModel> _val =
          await _transactionService.getTransactionsFromDB();

      setUserTransactions(_val);
      switchProgress();
    } on Exception {
      switchProgress();
      _setError(true);
      showToast("A Request Error Occured");
    }

    notifyListeners();
    return true;
  }
}
