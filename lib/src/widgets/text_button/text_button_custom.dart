import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class XTextButtonCus extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const XTextButtonCus({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
              onPressed: onPressed,
              child: Text(
                title,
                style: XStyle.textTheme().titleMedium,
              )),
          IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                MyIcons.arrowIcon,
                fit: BoxFit.cover,
                color: MyColors.colorPrimary,
              ))
        ],
      ),
    );
  }
}
