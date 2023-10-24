import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/cart/widgets/product_card_in_cart.dart';
import 'package:e_commerce/src/modules/cart/widgets/promo_code_widget.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/promotion/widgets/bottom_sheet_promotion.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_display.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return BlocBuilder<PromotionBloc, PromotionState>(
        builder: (context, promotionState) {
          final totalAmount =
              "${XUtils.formatPrice(state.totalPrice(promoCode: promotionState.discountPromotion))}\$";
          final _items = state.productsOfCart.data ?? [];
          XHandle _handle = XHandle.result(XResult.success(_items));

          state.sortBy.sortList(items: _items);
          if (_handle.isCompleted) {
            return Scaffold(
                backgroundColor: MyColors.colorBackground,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      Theme(
                        data: ThemeData(
                          appBarTheme: const AppBarTheme(
                            iconTheme:
                                IconThemeData(color: MyColors.colorBlack),
                          ),
                          textTheme: Theme.of(context).textTheme,
                        ),
                        child: const SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: XHeaderDelegate(
                              title: 'My Bag',
                              paddingHori: 0,
                              backgroundColor: MyColors.colorBackground),
                        ),
                      ),
                      _items.isEmpty
                          ? const EmptyDisplay()
                          : SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: XProductCardInCart(
                                      data: _items[index],
                                    ));
                              }, childCount: _items.length),
                            ),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: PromoCodeWidget(
                          onChanged: (value) => context
                              .read<PromotionBloc>()
                              .changedPromoCode(context, code: value),
                          onPressedArrowIcon: () => XBottomSheet.show(context,
                              backgroundColor: MyColors.colorBackground,
                              widget: const XBottomSheetPromotion()),
                          value: promotionState.promoCode,
                        ),
                      )),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total amount:',
                              style: TextStyle(
                                  height: 1.42,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.colorGray),
                            ),
                            Text(
                              totalAmount,
                              style: const TextStyle(
                                  height: 1.42,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.colorBlack),
                            )
                          ],
                        ),
                      )),
                      SliverToBoxAdapter(
                        child: XButton(
                          label: 'CHECK OUT',
                          height: 48,
                          width: double.infinity,
                          onPressed: state.onPressedCheckout(context),
                        ),
                      )
                    ],
                  ),
                ));
          } else if (_handle.isLoading) {
            return const XStateLoadingWidget();
          } else {
            return const XStateErrorWidget();
          }
        },
      );
    });
  }
}
