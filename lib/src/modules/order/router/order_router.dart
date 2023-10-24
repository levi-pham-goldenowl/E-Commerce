import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/details_order/pages/details_order_page.dart';
import 'package:e_commerce/src/modules/order/page/my_order_page.dart';
import 'package:e_commerce/src/modules/order/router/order_wrapper_router.dart';
import 'package:flutter/material.dart';

class OrderRouters {
  static const String myOrder = 'my_order';
  static const String detailOrder = 'detail_order';
}

class OrderCoordinator {
  static const autoRoute = AutoRoute(
      name: 'OrderWrapperRoute',
      page: OrderWrapperPage,
      path: OrderRouters.myOrder,
      children: [
        AutoRoute(path: '', page: MyOrderPage, name: 'MyOrderRoute'),
        AutoRoute(
          path: OrderRouters.detailOrder,
          page: DetailsOrderPage,
          name: "DetailsOrderRoute",
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showMyOrder(BuildContext context) =>
      context.router.push(const OrderWrapperRoute());
  static showDetailsOrder(BuildContext context, {required XOrder data}) =>
      context.router.push(DetailsOrderRoute(data: data));
}
