import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/modules/cart/pages/cart_page.dart';
import 'package:e_commerce/src/modules/checkout/pages/checkout_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartRouters {
  static const String checkout = 'checkout';
}

class CartCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.cartTab,
      page: EmptyRouterPage,
      name: 'CartTab',
      children: [
        AutoRoute(path: "", page: CartPage, name: "CartRoute"),
        AutoRoute(
            path: CartRouters.checkout,
            page: CheckoutPage,
            name: "CheckoutRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showCheckoutScreen(BuildContext context) {
    context
        .read<DeliveryBloc>()
        .changedDeliveryMethod(context, data: XDeliveryMethod.empty());
    context.router.push(const CheckoutRoute());
  }
}
