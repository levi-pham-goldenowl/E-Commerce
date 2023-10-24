import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

enum ViewType { listView, gridView }

extension ViewTypeExt on ViewType {
  String iconOf() {
    switch (this) {
      case ViewType.listView:
        return MyIcons.listIcon;
      case ViewType.gridView:
        return MyIcons.gridIcon;

      default:
        return "N/A";
    }
  }

  Color backgroundColor() {
    switch (this) {
      case ViewType.gridView:
        return MyColors.colorWhite;
      case ViewType.listView:
        return MyColors.colorBackground2;
      default:
        return MyColors.colorPrimary;
    }
  }
}
