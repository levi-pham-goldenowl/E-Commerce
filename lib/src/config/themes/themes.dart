import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/fonts.dart';
import 'package:flutter/material.dart';

class XTheme {
  static ThemeData light() => ThemeData(
        scaffoldBackgroundColor: MyColors.colorBackground,
        textTheme: XStyle.textTheme(),
        fontFamily: XFonts.metropolis,
        snackBarTheme:
            const SnackBarThemeData(backgroundColor: MyColors.colorPrimary),
        primaryColor: MyColors.colorPrimary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: MyColors.colorPrimary,
            shadowColor: MyColors.colorShadow,
            textStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, height: 1.42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      );
  static ThemeData dark() => ThemeData.dark();
}
