import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/review/widgets/button_write_review.dart';
import 'package:flutter/material.dart';

class FadeEndWidget extends StatelessWidget {
  final XProduct data;
  const FadeEndWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.78],
                colors: [
                  MyColors.colorWhite.withOpacity(0.22),
                  MyColors.colorWhite.withOpacity(1),
                ],
              ),
            )),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: XButtonWriteReview(data: data),
          ),
        ),
      ],
    );
  }
}
