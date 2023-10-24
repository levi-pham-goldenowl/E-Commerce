import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class DisCountLabel extends StatelessWidget {
  final String number;
  const DisCountLabel({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.colorPrimary,
          borderRadius: BorderRadius.circular(29)),
      height: 24,
      width: 40,
      child: Center(
        child: Text(
          "-$number%",
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: MyColors.colorWhite,
              height: 1,
              fontSize: 11,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
