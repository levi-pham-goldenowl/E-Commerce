import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return BlocBuilder<OrderBloc, OrderState>(
              builder: (context, orderState) {
                return BlocBuilder<DeliveryBloc, DeliveryState>(
                  builder: (context, deliveryState) {
                    final _items = cartState.productsOfCart.data ?? [];
                    final _deliveryMethodData =
                        (deliveryState.deliveryMethodData ?? XDeliveryMethod());
                    final _total = cartState.totalPrice(
                            promoCode: orderState.promotionData.discount) +
                        _deliveryMethodData.price;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: XButton(
                        label: 'SUBMIT ORDER',
                        height: 48,
                        width: double.infinity,
                        onPressed: state.canShippingAndPayment &&
                                deliveryState.isDeliveryMethodData
                            ? () => context.read<OrderBloc>().submitOrder(
                                context,
                                deliveryMethod: _deliveryMethodData,
                                paymentMethod: state.paymentMethodDefault,
                                shippingAddress: state.shippingAddressDefault,
                                listProducts: _items,
                                total: _total)
                            : null,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    ));
  }
}
