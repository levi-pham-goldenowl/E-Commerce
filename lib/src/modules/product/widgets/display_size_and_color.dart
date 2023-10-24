import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:flutter/material.dart';

class XDisplaySizeAndColor extends StatelessWidget {
  final XProduct data;
  const XDisplaySizeAndColor({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: 'Color: ',
            style: const TextStyle(
                fontSize: 11,
                height: 1,
                fontWeight: FontWeight.normal,
                color: MyColors.colorGray),
            children: <TextSpan>[
              TextSpan(
                  text: '${data.color}',
                  style: const TextStyle(color: MyColors.colorBlack)),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        RichText(
          text: TextSpan(
            text: 'Size: ',
            style: const TextStyle(
                fontSize: 11,
                height: 1,
                fontWeight: FontWeight.normal,
                color: MyColors.colorGray),
            children: <TextSpan>[
              TextSpan(
                  text: '${data.size}',
                  style: const TextStyle(color: MyColors.colorBlack)),
            ],
          ),
        )
      ],
    );
  }
}
