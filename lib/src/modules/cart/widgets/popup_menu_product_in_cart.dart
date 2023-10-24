import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopupMenuProductInCart extends StatelessWidget {
  const PopupMenuProductInCart({Key? key, required this.data})
      : super(key: key);
  final XProduct data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return SizedBox(
        height: 20,
        child: PopupMenuButton(
          offset: const Offset(-40, -40),
          padding: EdgeInsets.zero,
          icon: const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.more_vert,
              color: MyColors.colorGray,
            ),
          ),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onSelected: (newValue) {},
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];
            list.add(PopupMenuItem(
              height: 40,
              onTap: data.favorite
                  ? () => context
                      .read<FavoriteBloc>()
                      .removeProductToFavorite(context, product: data)
                  : () => context.read<FavoriteBloc>().addProductToFavorite(
                      context,
                      product: data,
                      sizeType: data.size ?? "N/A"),
              child: Center(
                child: Text(
                  data.favorite ? 'Remove to favorites' : 'Add to favorites',
                  style: XStyle.textTheme().labelSmall,
                ),
              ),
            ));

            list.add(const PopupMenuDivider());
            list.add(PopupMenuItem(
              height: 40,
              onTap: () => context
                  .read<CartBloc>()
                  .removeProductToCart(context, product: data),
              child: Center(
                child: Text(
                  'Delete from the list',
                  style: XStyle.textTheme().labelSmall,
                ),
              ),
            ));
            return list;
          },
        ),
      );
    });
  }
}
