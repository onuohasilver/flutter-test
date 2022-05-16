import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/transactions/transactions.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class HomeIntroButton extends StatelessWidget {
  const HomeIntroButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AllTransactions()));
      },
      child: const Text('Load'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w)),
        backgroundColor: MaterialStateProperty.all(AppColors.renmoneyBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
