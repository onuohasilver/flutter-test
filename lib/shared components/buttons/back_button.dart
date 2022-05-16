import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: ShowSVG(
              ImageAsset.back,
              height: 20,
              width: 7,
              color: color,
            )));
  }
}
