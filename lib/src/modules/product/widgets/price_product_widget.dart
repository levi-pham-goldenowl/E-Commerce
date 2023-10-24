import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';

class XPriceProductWidget extends StatelessWidget {
  final XProduct data;
  final double fontSize;
  const XPriceProductWidget({Key? key, required this.data, this.fontSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.discount == 0.0
        ? Text(
            "${XUtils.formatPrice(data.originalPrice)}\$ ",
            style: TextStyle(
                fontSize: fontSize,
                height: 1.42,
                color: MyColors.colorBlack,
                fontWeight: FontWeight.w600),
          )
        : RichText(
            text: TextSpan(
              text: "${XUtils.formatPrice(data.originalPrice)}\$ ",
              style: TextStyle(
                  fontSize: fontSize,
                  height: 1.42,
                  decoration: TextDecoration.lineThrough,
                  color: MyColors.colorGray,
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                    text: "${XUtils.formatPrice(data.currentPrice ?? -1)}\$",
                    style: const TextStyle(
                      color: MyColors.colorPrimary,
                      decoration: TextDecoration.none,
                    )),
              ],
            ),
          );
  }
}
