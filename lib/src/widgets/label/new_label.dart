import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class NewLabel extends StatelessWidget {
  const NewLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: MyColors.colorBlack, borderRadius: BorderRadius.circular(29)),
      height: size.height * 0.029,
      width: size.height * 0.049,
      child: const Center(
        child: Text(
          "NEW",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: MyColors.colorWhite,
              height: 1,
              fontSize: 11,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
