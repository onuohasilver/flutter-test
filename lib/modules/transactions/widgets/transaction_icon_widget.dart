import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, required this.data}) : super(key: key);
  final IconWidgetData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 35.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: data.color),
      child: Center(child: data.image),
    );
  }
}

class IconWidgetData {
  final Color color;
  final Widget image;

  IconWidgetData(this.color, this.image);
}
