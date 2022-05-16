import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class AppTheme {
  final ThemeData _darkTheme = ThemeData(
    primaryColor: Colors.white.withOpacity(.67),
    brightness: Brightness.dark,
    backgroundColor: const Color.fromRGBO(17, 24, 39, 1),
    cardColor: const Color.fromRGBO(31, 41, 55, 1),
    dividerColor: Colors.black12,
    canvasColor: const Color.fromRGBO(17, 24, 39, 1),
  );

  final ThemeData _lightTheme = ThemeData(
      backgroundColor: Colors.white,
      fontFamily: "ProductSans",
      primaryColor: Colors.black,
      canvasColor: AppColors.greyPurple,
      cardColor: AppColors.lightGrey);

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
}
