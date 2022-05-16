import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_provider.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/modules/transactions/screens/transaction_details.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/transaction_icon_widget.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, this.index = 0, required this.model})
      : super(key: key);
  final int index;
  final TransactionModel model;

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: BounceInUp(
        delay: Duration(milliseconds: index + 1 * 130),
        child: FadeInUp(
          delay: Duration(milliseconds: index + 1 * 60),
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.h),
              onTap: () {
                transactionProvider.selectTransaction(model);
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const TransactionDetailScreen()));
              },
              child: Container(
                width: 330.w,
                height: 69.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 13.w),
                child: Row(
                  children: [
                    IconWidget(data: getIconByType(model.type!)),
                    const XSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: '${model.comment}',
                                children: const [
                                  TextSpan(
                                      text: "John",
                                      style: TextStyle(
                                          color: AppColors.purple,
                                          fontWeight: FontWeight.w700))
                                ],
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13.h)),
                          ),
                        ),
                        const YSpace(7),
                        Text("${model.entryDate}",
                            style: TextStyle(
                                fontSize: 11.h,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGrey))
                      ],
                    ),
                    const Spacer(),
                    Text("₦ ${model.amount}",
                        style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w700,
                            color: model.amount! > 0
                                ? Colors.green
                                : AppColors.red))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
