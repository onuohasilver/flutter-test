import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({Key? key, required this.retry}) : super(key: key);
  final Function() retry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const YSpace(8),
          Text(
            'An error occured',
            style: TextStyle(fontSize: 14.h),
          ),
          IconButton(
            onPressed: retry,
            icon: const Icon(Icons.replay_rounded),
            padding: EdgeInsets.all(10.w),
          )
        ],
      ),
    );
  }
}
