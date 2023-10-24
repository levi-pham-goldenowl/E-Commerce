import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumsWidget extends StatelessWidget {
  const SumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _sizeBox = SizedBox(height: 14);
    return SliverToBoxAdapter(child: BlocBuilder<DeliveryBloc, DeliveryState>(
        builder: (context, delivertState) {
      return BlocBuilder<PromotionBloc, PromotionState>(
          builder: (context, promotionState) {
        return BlocBuilder<CartBloc, CartState>(builder: (context, cartState) {
          final _priceOrder =
              cartState.totalPrice(promoCode: promotionState.discountPromotion);
          final _priceDelivery =
              (delivertState.deliveryMethodData ?? XDeliveryMethod()).price;
          final _priceSummary = _priceOrder + _priceDelivery;
          return Column(
            children: [
              _orderWidget(_priceOrder),
              _sizeBox,
              _deliveryWidget(_priceDelivery),
              _sizeBox,
              _summaryWidget(_priceSummary)
            ],
          );
        });
      });
    }));
  }
}

Widget _orderWidget(double price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Order:',
        style: TextStyle(
            color: MyColors.colorGray,
            height: 1.42,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      _priceText(price)
    ],
  );
}

Widget _deliveryWidget(double price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Delivery:',
        style: TextStyle(
            color: MyColors.colorGray,
            height: 1.42,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      _priceText(price)
    ],
  );
}

Widget _summaryWidget(double price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Summary:',
        style: TextStyle(
            color: MyColors.colorGray,
            height: 1,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      _priceText(price)
    ],
  );
}

Text _priceText(double price) {
  return Text('${XUtils.formatPrice(price)}\$',
      style: const TextStyle(
          color: MyColors.colorBlack,
          height: 1,
          fontSize: 16,
          fontWeight: FontWeight.w600));
}
