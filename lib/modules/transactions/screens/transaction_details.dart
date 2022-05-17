import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/transaction_detail_entry.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionModel model =
        Provider.of<TransactionProvider>(context).selectedTransaction!;
    return Material(
      child: Container(
        height: 875.h,
        width: 312.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: Theme.of(context).canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSpace(61),
            const AppBackButton(color: Colors.white),
            const YSpace(23),
            Text('Transaction Details',
                style: AppTextStyle.heading(Colors.white)),
            const YSpace(24),
            Container(
              height: 349.h,
              width: 334.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              padding: EdgeInsets.only(left: 16.w, top: 36.h, right: 37.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Detailed summary of transaction',
                      style: AppTextStyle.title1(AppColors.purple)),
                  const YSpace(22),
                  DetailEntry(leading: 'Type', content: model.type),
                  DetailEntry(leading: 'Amount', content: "₦ ${model.amount}"),
                  DetailEntry(
                      leading: 'Transaction Date', content: model.entryDate!),
                  DetailEntry(
                      leading: 'Reference', content: model.transactionId),
                  Row(
                    children: [
                      Text('Status',
                          style: AppTextStyle.title1(AppColors.darkGrey)),
                      const Spacer(),
                      Icon(
                        Icons.circle,
                        size: 7.w,
                        color: Colors.green,
                      ),
                      Text(' Successful',
                          style: AppTextStyle.title2(Colors.green)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
