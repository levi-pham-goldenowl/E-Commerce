import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class BottomSign extends StatelessWidget {
  final String title;
  final Function()? onClickGoogle;
  const BottomSign({Key? key, required this.title, this.onClickGoogle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: XStyle.textTheme().titleMedium),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(MyIcons.ggIcon, onPressed: onClickGoogle ?? () {}),
            _socialButton(MyIcons.fbIcon, onPressed: () {})
          ],
        ),
      ],
    );
  }
}

Widget _socialButton(String image, {required Function() onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            offset: Offset(0, 1),
            color: MyColors.colorShadowTextFormField,
            blurRadius: 8,
            spreadRadius: 1)
      ], borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Image.asset(image),
        style: ElevatedButton.styleFrom(
          primary: MyColors.colorWhite,
        ),
      ),
    ),
  );
}
