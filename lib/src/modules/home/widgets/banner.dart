import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.24,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  MyImages.bannerImage,
                ),
                fit: BoxFit.fill)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.0257, bottom: size.height * 0.0319),
            child: const Text(
              'Street clothes',
              style: TextStyle(
                  color: MyColors.colorWhite,
                  fontSize: 34,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ));
  }
}
