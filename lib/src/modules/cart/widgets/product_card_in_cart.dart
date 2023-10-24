import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/cart/widgets/popup_menu_product_in_cart.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product/widgets/display_size_and_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'icon_circle_button.dart';

class XProductCardInCart extends StatelessWidget {
  final XProduct data;

  const XProductCardInCart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DashboardCoordinator.showDetailsProduct(context,
          data: data, id: data.id),
      child: Container(
        decoration: BoxDecoration(
            color: MyColors.colorWhite,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 25,
                  color: MyColors.colorShadowCircle.withOpacity(0.08),
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        height: 104,
        width: 343,
        child: Row(
          children: [
            _image(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 4, child: _topWidget(context)),
                    Expanded(flex: 6, child: _bottomWidget())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return SizedBox(
      height: 104,
      width: 104,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        child: Image(
          fit: BoxFit.fill,
          image: NetworkImage(data.image ?? "N/A"),
        ),
      ),
    );
  }

  Widget _bottomWidget() {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconCircleButton(
                  icon: const Icon(Icons.remove, color: MyColors.colorGray),
                  onPressed: () => context
                      .read<CartBloc>()
                      .decreaseProduct(context, product: data)),
              const SizedBox(
                width: 16,
              ),
              Text(
                data.amount.toString(),
                style: const TextStyle(
                    color: MyColors.colorBlack,
                    fontSize: 14,
                    height: 1.42,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 16,
              ),
              IconCircleButton(
                  icon: const Icon(
                    Icons.add,
                    color: MyColors.colorGray,
                  ),
                  onPressed: () => context
                      .read<CartBloc>()
                      .increaseProduct(context, product: data)),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('${state.priceProduct(data)}\$',
                      style: const TextStyle(
                          height: 1.42,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))))
        ],
      );
    });
  }

  Widget _topWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.type,
              style: const TextStyle(
                  color: MyColors.colorBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1),
            ),
            XDisplaySizeAndColor(data: data),
          ],
        ),
        PopupMenuProductInCart(
          data: data,
        )
      ],
    );
  }
}
