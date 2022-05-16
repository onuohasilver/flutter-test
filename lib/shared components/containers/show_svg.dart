import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowSVG extends StatelessWidget {
  final String name;
  final double height, width;
  final Color? color;
  const ShowSVG(this.name,
      {Key? key, this.height = 10, this.width = 10, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: FittedBox(
        child: SvgPicture.asset(
          'assets/$name.svg',
          color: color,
          width: width.w,
          height: height.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
