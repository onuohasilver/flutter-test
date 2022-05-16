import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/modules/transactions/screens/transaction_details.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, this.index = 0, required this.model})
      : super(key: key);
  final int index;
  final TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: BounceInUp(
        delay: Duration(milliseconds: index + 1 * 200),
        child: FadeInUp(
          delay: Duration(milliseconds: index + 1 * 60),
          child: Material(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8.h),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.h),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionDetailScreen()));
              },
              child: Container(
                width: 330.w,
                height: 69.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 13.w),
                child: Row(
                  children: [
                    Container(
                      height: 35.h,
                      width: 35.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(119, 101, 196, 0.098)),
                      child: const Center(
                          child: ShowSVG(ImageAsset.arrowDown,
                              height: 10, width: 8.05)),
                    ),
                    const XSpace(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Money Transfer to ',
                              children: const [
                                TextSpan(
                                    text: "John",
                                    style: TextStyle(
                                        color: AppColors.purple,
                                        fontWeight: FontWeight.w700))
                              ],
                              style: TextStyle(
                                  color: Colors.black, fontSize: 13.h)),
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
                    Text("- ₦ ${model.amount}",
                        style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w700,
                            color: AppColors.red))
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
