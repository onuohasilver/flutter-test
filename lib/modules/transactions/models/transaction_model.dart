import 'package:intl/intl.dart';

class TransactionModel {
  int? transactionId;
  String? type;
  double? amount;
  String? comment;
  String? entryDate;
  String? currencyCode;
  String? balance;

  TransactionModel(
      {this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    type = json['type'];
    amount = json['amount'];
    comment = json['comment'];
    entryDate = formatDate(DateTime.parse(json['entryDate'].toString()));
    currencyCode = json['currencyCode'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['type'] = type;
    data['amount'] = amount;
    data['comment'] = comment;
    data['entryDate'] = entryDate;
    data['currencyCode'] = currencyCode;
    data['balance'] = balance;
    return data;
  }
}

// ignore: non_constant_identifier_names

String formatDate(DateTime date) {
  return DateFormat('d MMM, ' 'yyyy').format(date);
}

TransactionType getTransactionType(String type) {
  switch (type) {
    case "INTEREST_APPLIED":
      return TransactionType.deposit;
    case "WITHDRAWAL_ADJUSTMENT":
      return TransactionType.deposit;
    case "WITHDRAWAL":
      return TransactionType.withdrawal;
    case "DEPOSIT":
      return TransactionType.deposit;
    case "TRANSFER":
      return TransactionType.withdrawal;
    default:
      return TransactionType.withdrawal;
  }
}

enum TransactionType { phone, withdrawal, deposit }

String currency(number) {
  final _currency = NumberFormat.currency(symbol: "");
  return _currency.format(number);
}
