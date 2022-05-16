import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return _DetailEntry(index,
                            leading: 'Recipient', content: 'John');
                      },
                    ),
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
  const _DetailEntry(
    this.index, {
    Key? key,
    required this.leading,
    required this.content,
  }) : super(key: key);
  final String leading, content;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: index + 1 * 400),
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recipient', style: AppTextStyle.title1(AppColors.darkGrey)),
            Text('John', style: AppTextStyle.title2(Colors.black))
          ],
        ),
      ),
    );
  }
}
