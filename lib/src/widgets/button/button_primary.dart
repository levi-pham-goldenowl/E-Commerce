import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final String label;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  const XButton(
      {Key? key,
      required this.label,
      this.width,
      this.height = 36,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: XStyle.textTheme().labelMedium,
        ),
      ),
    );
  }
}
