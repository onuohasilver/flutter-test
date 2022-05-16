import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left)));
  }
}
