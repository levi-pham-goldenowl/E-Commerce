import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

enum SizeType { xs, s, m, l, xl }

extension SizeTypeExt on SizeType {
  String value() {
    switch (this) {
      case SizeType.xs:
        return "XS";
      case SizeType.s:
        return "S";
      case SizeType.m:
        return "M";
      case SizeType.l:
        return "L";
      case SizeType.xl:
        return "XL";

      default:
        return "N/A";
    }
  }

  bool selectedSize(SizeType value) {
    return value == this ? true : false;
  }

  TextStyle styleOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return const TextStyle(
            fontSize: 16,
            height: 1,
            color: MyColors.colorWhite,
            fontWeight: FontWeight.w500);
      case false:
        return const TextStyle(
            height: 1.42,
            fontSize: 14,
            color: MyColors.colorBlack,
            fontWeight: FontWeight.w500);

      default:
        return const TextStyle();
    }
  }

  ButtonStyle styleElevatedOf(bool isSelected) {
    switch (isSelected) {
      case true:
        return ElevatedButton.styleFrom(
            primary: MyColors.colorPrimary,
            onPrimary: MyColors.colorWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                    color: MyColors.colorPrimary, width: 0.4)));
      case false:
        return ElevatedButton.styleFrom(
            primary: MyColors.colorWhite,
            onPrimary: MyColors.colorPrimary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: MyColors.colorGray, width: 0.4)));

      default:
        return ElevatedButton.styleFrom();
    }
  }
}
