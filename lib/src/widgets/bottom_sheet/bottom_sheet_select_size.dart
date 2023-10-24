import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSelectSize extends StatelessWidget {
  final PageInfo pageInfo;

  final XProduct data;
  const XBottomSheetSelectSize({
    Key? key,
    required this.data,
    required this.pageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 5,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Select size',
              style: XStyle.textTheme().headlineSmall,
            ),
            sizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 100,
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 100 / 40,
                  crossAxisSpacing: 22,
                  mainAxisSpacing: 16,
                  children: SizeType.values
                      .map((e) => _boxSize(
                          sizeType: e,
                          onPressed: () {
                            switch (pageInfo) {
                              case PageInfo.favorites:
                                context
                                    .read<FavoriteBloc>()
                                    .onSelectSize(e.index);
                                break;
                              case PageInfo.cart:
                                context.read<CartBloc>().onSelectSize(e.index);
                                break;

                              default:
                            }
                          }))
                      .toList(),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Size info',
                style: TextStyle(
                    color: MyColors.colorBlack,
                    height: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              onTap: () {},
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            sizedBox,
            _buttonBottom()
          ],
        ),
      ),
    );
  }

  Widget _buttonBottom() {
    switch (pageInfo) {
      case PageInfo.favorites:
        return BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
          return XButton(
              label: 'ADD TO FAVORITES',
              height: 47,
              width: double.infinity,
              onPressed: state.hadFavorites(data)
                  ? null
                  : () => context.read<FavoriteBloc>().addProductToFavorite(
                      context,
                      product: data,
                      sizeType: state.sizeType.value()));
        });
      case PageInfo.cart:
        return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return XButton(
              label: 'ADD TO CART',
              height: 47,
              width: double.infinity,
              onPressed: state.hadCart(data)
                  ? null
                  : () => context.read<CartBloc>().addToCart(context,
                      product: data, sizeType: state.sizeType.value()));
        });
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _boxSize({required SizeType sizeType, required Function() onPressed}) {
    switch (pageInfo) {
      case PageInfo.favorites:
        return BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
          return SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              onPressed: onPressed,
              style: state.sizeType
                  .styleElevatedOf(sizeType.selectedSize(state.sizeType)),
              child: Center(
                child: Text(sizeType.value(),
                    textAlign: TextAlign.center,
                    style: state.sizeType
                        .styleOf(sizeType.selectedSize(state.sizeType))),
              ),
            ),
          );
        });
      case PageInfo.cart:
        return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              onPressed: onPressed,
              style: state.sizeType
                  .styleElevatedOf(sizeType.selectedSize(state.sizeType)),
              child: Center(
                child: Text(sizeType.value(),
                    textAlign: TextAlign.center,
                    style: state.sizeType
                        .styleOf(sizeType.selectedSize(state.sizeType))),
              ),
            ),
          );
        });
      default:
        return const SizedBox.shrink();
    }
  }
}
