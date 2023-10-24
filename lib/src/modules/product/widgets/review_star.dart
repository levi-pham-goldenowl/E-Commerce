import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class XReviewStar extends StatelessWidget {
  final int numberStar;
  const XReviewStar({Key? key, required this.numberStar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberStarActive = (numberStar ~/ 5);
    var numberStarNoActive = 5 - numberStarActive;
    return Row(
      children: [
        SizedBox(
          height: 20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 13,
                  height: 12,
                  child: Image.asset(MyIcons.activeStarIcon,
                      fit: BoxFit.scaleDown),
                );
              },
              itemCount: numberStarActive),
        ),
        SizedBox(
          height: 20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 13,
                  height: 12,
                  child: Image.asset(MyIcons.starIcon, fit: BoxFit.scaleDown),
                );
              },
              itemCount: numberStarNoActive),
        ),
        const SizedBox(width: 3),
        Text(
          '(${numberStar.toString()})',
          style: const TextStyle(
              fontSize: 10,
              color: MyColors.colorGray,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
