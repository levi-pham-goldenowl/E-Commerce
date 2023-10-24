import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/widgets/label/discount_label.dart';
import 'package:e_commerce/src/widgets/label/new_label.dart';
import 'package:flutter/material.dart';

class XDisplayLabel extends StatelessWidget {
  final XProduct data;
  const XDisplayLabel({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: data.newProduct == true
          ? const NewLabel()
          : (data.discount != 0
              ? DisCountLabel(number: data.discount.toString())
              : const SizedBox.shrink()),
    );
  }
}
