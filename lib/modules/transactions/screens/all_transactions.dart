import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/widgets.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 875.h,
        width: 312.w,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSpace(61),
            const AppBackButton(),
            const YSpace(23),
            Text('All Transactions',
                style: AppTextStyle.heading(AppColors.purple)),
            const YSpace(23),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionCard(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
