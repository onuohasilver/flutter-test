import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/entry/widgets/widgets.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812.h,
      width: 375.w,
      color: Colors.white,
      child: const Center(child: HomeIntroButton()),
    );
  }
}
