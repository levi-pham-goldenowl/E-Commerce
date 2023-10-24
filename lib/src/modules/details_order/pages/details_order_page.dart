import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/details_order/widgets/buttons_bottom_order.dart';
import 'package:e_commerce/src/modules/details_order/widgets/order_information.dart';
import 'package:e_commerce/src/modules/details_order/widgets/products_order.dart';
import 'package:e_commerce/src/modules/details_order/widgets/top_screen_order.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsOrderPage extends StatelessWidget {
  const DetailsOrderPage({Key? key, required this.data}) : super(key: key);
  final XOrder data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XDefaultAppBar(
        backgroundColor: MyColors.colorWhite,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: MyColors.colorBlack,
            onPressed: () {},
          )
        ],
        title: 'Order Details',
        style: const TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      body: CustomScrollView(
        slivers: [
          TopScreenOrder(data: data),
          ProductsOrder(data: data),
          OrderInfomation(data: data),
          const ButtonsBottomOrder()
        ],
      ),
    );
  }
}
