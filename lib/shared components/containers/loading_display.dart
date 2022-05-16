import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class FutureLoader extends StatelessWidget {
  const FutureLoader({Key? key, required this.control, required this.child})
      : super(key: key);
  final Widget child;
  final bool control;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: control
          ? SizedBox(
              height: 600.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                      strokeWidth: 2, color: AppColors.purple),
                  const YSpace(8),
                  Text(
                    'Retrieving your transaction history',
                    style: TextStyle(fontSize: 14.h),
                  )
                ],
              ),
            )
          : child,
    );
  }
}
