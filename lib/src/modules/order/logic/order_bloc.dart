import 'dart:math';

import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'order_state.dart';

class OrderBloc extends Cubit<OrderState> {
  OrderBloc()
      : super(OrderState(
            listProducts: const [],
            listOrder: const [],
            paymentMethodData: XPaymentMethod.empty(),
            promotionData: XPromotion.empty(),
            shippingAddressData: XShippingAddress.empty())) {
    getMyOrder();
  }

  final Domain _domain = Domain();

  void changePromo(XPromotion promotion) =>
      emit(state.copyWith(promotionData: promotion));

  Future<void> getMyOrder() async {
    final value = await _domain.order.getYourOrder();
    if (value.isSuccess) {
      List<XOrder> items = [...(state.listOrder)];
      items = (value.data ?? []).toList();
      emit(state.copyWith(listOrder: items));
    } else {}
  }

  Future<void> submitOrder(BuildContext context,
      {required XPaymentMethod paymentMethod,
      required XShippingAddress shippingAddress,
      required XDeliveryMethod deliveryMethod,
      required List<XProduct> listProducts,
      required double total}) async {
    XSnackBar.showLoading();

    var formatter = DateFormat('dd-MM-yyyy');

    String date = formatter.format(DateTime.now());

    final xOrder = XOrder(
      shippingAddressData: shippingAddress,
      paymentMethodData: paymentMethod,
      promotionData: state.promotionData,
      listProducts: listProducts,
      date: date,
      id: _getRandomIdOrder(),
      deliveryMethodData: deliveryMethod,
      status: 'Delivered',
      total: total,
      trackingNumber: _getRandomTracking(),
    );

    final value = await _domain.order.addOrder(xOrder);
    if (value.isSuccess) {
      final List<XOrder> items = [...(state.listOrder), xOrder];
      emit(state.copyWith(
        listOrder: items,
      ));

      context
          .read<CartBloc>()
          .removeYourCard(context, listProducts: listProducts);

      DashboardCoordinator.showSuccess(context);
      XSnackBar.show(msg: 'Add order success');
    } else {
      XSnackBar.show(msg: 'Add order failure');
    }
    XSnackBar.hideLoading();
  }

  String _getRandomIdOrder() {
    const _chars = '1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        7, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  String _getRandomTracking() {
    const _charsPrefix = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const _charsNumber = '1234567890';
    Random _rnd = Random();
    final prefixString = String.fromCharCodes(Iterable.generate(
        2, (_) => _charsPrefix.codeUnitAt(_rnd.nextInt(_charsPrefix.length))));

    final numberString = String.fromCharCodes(Iterable.generate(10,
        (_) => _charsNumber.codeUnitAt(_rnd.nextInt(_charsNumber.length - 1))));
    return prefixString + numberString;
  }
}
