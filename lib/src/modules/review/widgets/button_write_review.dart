import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_router.dart';
import 'package:flutter/material.dart';

class XButtonWriteReview extends StatelessWidget {
  final XProduct data;
  const XButtonWriteReview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.edit),
        onPressed: () =>
            ProductDetailsCoordinator.showWriteReview(context, data: data),
        label: const Text('Write a review',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.colorWhite,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1.2)),
      ),
    );
  }
}
