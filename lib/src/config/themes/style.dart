import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XStyle {
  static TextTheme textTheme() => const TextTheme(
        //headline
        headlineLarge: TextStyle(
            fontSize: 34,
            height: 1,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.bold),
        //11px
        labelSmall: TextStyle(
            fontSize: 11,
            height: 1,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.normal),
        //14px
        labelLarge: TextStyle(
            fontSize: 14,
            height: kIsWeb ? 0.7 : 0.1,
            color: MyColors.colorGray,
            fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 14,
            height: kIsWeb ? 0.7 : 0.1,
            color: MyColors.colorInputTextFormField,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            fontSize: 14,
            height: 1.4286,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.w500),
        //16px
        //description
        bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.5,
            letterSpacing: -0.15,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.normal),
        //headline 2
        headlineMedium: TextStyle(
            fontSize: 24,
            height: 1.2,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.w600),

        //headline 3
        headlineSmall: TextStyle(
            fontSize: 18,
            height: 1.2222,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.w600),
      );
}
