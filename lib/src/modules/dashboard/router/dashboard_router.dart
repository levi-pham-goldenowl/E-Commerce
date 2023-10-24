import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/router/cart_router.dart';
import 'package:e_commerce/src/modules/dashboard/pages/dashboard_page.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_wrapper_router.dart';
import 'package:e_commerce/src/modules/favorites/router/favorites_router.dart';
import 'package:e_commerce/src/modules/home/router/home_router.dart';
import 'package:e_commerce/src/modules/payment_method/router/payment_method_router.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_router.dart';
import 'package:e_commerce/src/modules/profile/router/profile_router.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/shipping_address/router/shipping_address_router.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:e_commerce/src/modules/success/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardTaps {
  static const String homeTab = 'home';
  static const String shopTab = 'shop';
  static const String cartTab = 'cart';
  static const String favoritesTab = 'favorites';
  static const String profileTab = 'profile';
}

class DashboardRouters {
  static const String productDetail = 'product/:id';
  static const String success = 'success';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    children: [
      AutoRoute(
          name: "DashboardRoute",
          page: DashboardPage,
          initial: true,
          children: [
            HomeCoordinator.autoRoute,
            ShopCoordinator.autoRoute,
            CartCoordinator.autoRoute,
            FavoritesCoordinator.autoRoute,
            ProfileCoordinator.autoRoute,
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      ProductDetailsCoordinator.autoRoute,
      PaymentMethodCoordinator.autoRoute,
      ShippingAddressCoordinator.autoRoute,
      AutoRoute(
          name: "SuccessRoute",
          page: SuccessPage,
          path: DashboardRouters.success),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static showYourCart(BuildContext context) {
    context.read<PromotionBloc>().changedPromoCode(context, code: '');
    context.router.navigate(const DashboardRoute(children: [CartTab()]));
  }

  static showDetailsProduct(BuildContext context,
      {XProduct? data, required String id}) {
    var value = data ?? XProduct();
    return context.router
        .push(ProductDetailsWrapperRoute(data: value, id: value.id));
  }

  static showPaymentMethod(BuildContext context) =>
      context.router.push(const PaymentMethodRoute());

  static showShippingAddresses(BuildContext context) =>
      context.router.push(const ShippingAddressesWrapperRoute());
  static showSuccess(BuildContext context) =>
      context.router.push(const SuccessRoute());
}
