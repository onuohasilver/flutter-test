import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
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
        color: AppColors.greyPurple,
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
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.only(left: 16.w, top: 36.h, right: 37.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Detailed summary of transaction',
                      style: AppTextStyle.title1(AppColors.purple)),
                  const YSpace(22),
                  _DetailEntry(leading: 'Type', content: model.type),
                  _DetailEntry(leading: 'Amount', content: model.amount),
                  _DetailEntry(
                      leading: 'Transaction Date', content: model.entryDate!),
                  _DetailEntry(
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
                          style: AppTextStyle.title1(Colors.green)),
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

class _DetailEntry extends StatelessWidget {
  const _DetailEntry({
    Key? key,
    required this.leading,
    required this.content,
  }) : super(key: key);
  final String leading;
  final dynamic content;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: Random().nextInt(1000)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leading, style: AppTextStyle.title1(AppColors.darkGrey)),
            Text(content.toString(), style: AppTextStyle.title2(Colors.black))
          ],
        ),
      ),
    );
  }
}
