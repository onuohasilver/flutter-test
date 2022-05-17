import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class DetailEntry extends StatelessWidget {
  const DetailEntry({
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
            Text(content.toString(),
                style: AppTextStyle.title2(Theme.of(context).primaryColor))
          ],
        ),
      ),
    );
  }
}
