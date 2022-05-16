import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/widgets.dart';
import 'package:renmoney_flutter_test/shared%20components/containers/loading_display.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      TransactionProvider transactionProvider =
          Provider.of<TransactionProvider>(context, listen: false);
      transactionProvider.getTransactions();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    return Material(
      child: Container(
        height: 875.h,
        width: 312.w,
        color: Theme.of(context).backgroundColor,
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
            FutureLoader(
              control: transactionProvider.isInProgress,
              child: Flexible(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: transactionProvider.userTransactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionCard(
                        index: index,
                        model: transactionProvider.userTransactions[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
