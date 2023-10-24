import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/details_order/widgets/card_products_order.dart';
import 'package:flutter/material.dart';

class ProductsOrder extends StatelessWidget {
  const ProductsOrder({Key? key, required this.data}) : super(key: key);
  final XOrder data;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data.listProducts.length} items',
              style: const TextStyle(
                  height: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: MyColors.colorBlack),
            ),
            Column(
              children: data.listProducts
                  .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: XProductCardOrder(data: e)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
