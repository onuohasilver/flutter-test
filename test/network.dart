import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/network_calls.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/network/network_base.dart';

fetchDataTest() {
  test(
    'Test network requests',
    () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "status": "Successful",
          "code": "MwI00",
          "message": "Successful",
          "data": {
            "clientTransactions": [
              {
                "transactionId": 151361,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_t62r7knppp",
                "entryDate": "2022-04-14T03:04:04+0000",
                "currencyCode": "NGN",
                "balance": "108655.04"
              },
              {
                "transactionId": 151346,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment": null,
                "entryDate": "2022-04-14T02:38:28+0000",
                "currencyCode": "NGN",
                "balance": "107655.04"
              },
              {
                "transactionId": 151345,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_rjb20av9js",
                "entryDate": "2022-04-14T02:32:51+0000",
                "currencyCode": "NGN",
                "balance": "106655.04"
              },
              {
                "transactionId": 151344,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_rjb20av9js",
                "entryDate": "2022-04-14T02:31:16+0000",
                "currencyCode": "NGN",
                "balance": "105655.04"
              },
              {
                "transactionId": 151342,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
                "entryDate": "2022-04-14T00:35:42+0000",
                "currencyCode": "NGN",
                "balance": "104655.04"
              },
              {
                "transactionId": 151341,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment": null,
                "entryDate": "2022-04-14T00:30:36+0000",
                "currencyCode": "NGN",
                "balance": "103655.04"
              },
              {
                "transactionId": 151340,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_2f25cfnnud",
                "entryDate": "2022-04-14T00:27:28+0000",
                "currencyCode": "NGN",
                "balance": "102655.04"
              },
              {
                "transactionId": 151339,
                "type": "DEPOSIT",
                "amount": 10000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
                "entryDate": "2022-04-13T18:03:08+0000",
                "currencyCode": "NGN",
                "balance": "101655.04"
              },
              {
                "transactionId": 151338,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment": null,
                "entryDate": "2022-04-13T18:02:39+0000",
                "currencyCode": "NGN",
                "balance": "91655.04"
              },
              {
                "transactionId": 151337,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
                "entryDate": "2022-04-13T18:00:52+0000",
                "currencyCode": "NGN",
                "balance": "90655.04"
              },
              {
                "transactionId": 151116,
                "type": "INTEREST_APPLIED",
                "amount": 755.04,
                "comment": null,
                "entryDate": "2022-04-09T00:00:00+0000",
                "currencyCode": "NGN",
                "balance": "89655.04"
              },
              {
                "transactionId": 148818,
                "type": "TRANSFER",
                "amount": -4000.0,
                "comment":
                    "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
                "entryDate": "2022-03-09T09:29:09+0000",
                "currencyCode": "NGN",
                "balance": "88900"
              },
              {
                "transactionId": 148816,
                "type": "TRANSFER",
                "amount": -5600.0,
                "comment":
                    "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
                "entryDate": "2022-03-09T09:28:44+0000",
                "currencyCode": "NGN",
                "balance": "92900"
              },
              {
                "transactionId": 148815,
                "type": "DEPOSIT",
                "amount": 1000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
                "entryDate": "2022-03-09T09:28:25+0000",
                "currencyCode": "NGN",
                "balance": "98500"
              },
              {
                "transactionId": 148814,
                "type": "WITHDRAWAL",
                "amount": -500.0,
                "comment":
                    "BillPayment Airtime Purchase Reference: bd9438f2-d05c-4562-a37d-8a753c310aba",
                "entryDate": "2022-03-09T09:27:11+0000",
                "currencyCode": "NGN",
                "balance": "97500"
              },
              {
                "transactionId": 148813,
                "type": "DEPOSIT",
                "amount": 90000.0,
                "comment":
                    "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
                "entryDate": "2022-03-09T09:26:40+0000",
                "currencyCode": "NGN",
                "balance": "98000"
              },
            ]
          }
        };
        return Response(jsonEncode(response), 200);
      });
      expect(
          await TransactionService()
              .getTransactionsFromDB(NetworkRequests(mockHTTPClient)),
          isA<List<TransactionModel>>());
    },
  );
  test('On Failure', () async {
    final mockHTTPClient = MockClient((request) async {
      const response = {};
      return Response(jsonEncode(response), 404);
    });

    expect(
        () async => await TransactionService()
            .getTransactionsFromDB(NetworkRequests(mockHTTPClient)),
        throwsA(isA<Exception>()));
  });
}
