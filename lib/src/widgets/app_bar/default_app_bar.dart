import 'package:flutter/material.dart';

import 'package:e_commerce/src/config/themes/my_colors.dart';

class XDefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Function()? onPressed;
  final Widget? leading;
  final double elevation;
  final Color? backgroundColor;
  final TextStyle? style;
  const XDefaultAppBar({
    Key? key,
    this.style,
    this.elevation = 0,
    this.backgroundColor,
    this.onPressed,
    this.title = '',
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: style),
      centerTitle: true,
      bottomOpacity: 8,
      actions: actions,
      shadowColor: MyColors.colorWhite,
      leading: leading,
      iconTheme: const IconThemeData(color: MyColors.colorBlack),
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
