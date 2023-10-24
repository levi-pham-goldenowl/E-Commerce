import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class IconCircleButton extends StatelessWidget {
  const IconCircleButton({
    Key? key,
    required this.icon,
    this.onPrimary = MyColors.colorPrimary,
    this.primary = MyColors.colorWhite,
    this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final Function()? onPressed;
  final Color primary;
  final Color onPrimary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          primary: primary,
          onPrimary: onPrimary,
        ),
      ),
    );
  }
}
