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
              height: 812.h,
              child: const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: AppColors.purple)),
            )
          : child,
    );
  }
}
