import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/pages/adding_shipping_address_page.dart';
import 'package:e_commerce/src/modules/shipping_address/edit_shipping_address/edit_shipping_address_page.dart';
import 'package:e_commerce/src/modules/shipping_address/logic/shipping_address_bloc.dart';
import 'package:e_commerce/src/modules/shipping_address/router/shipping_address_wrapper_router.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressRouters {
  static const String shippingAddress = 'shipping_address';
  static const String addShippingAddress = 'add_shipping_address';
  static const String editShippingAddress = 'edit_shipping_address';
}

class ShippingAddressCoordinator {
  static const autoRoute = AutoRoute(
      path: ShippingAddressRouters.shippingAddress,
      page: ShippingAddressWrapperPage,
      name: "ShippingAddressesWrapperRoute",
      children: [
        AutoRoute(
          path: '',
          page: ShippingAddressesPage,
          name: "ShippingAddressesRoute",
        ),
        AutoRoute(
          path: ShippingAddressRouters.addShippingAddress,
          page: AddShippingAddressPage,
          name: "AddShippingAddressRoute",
        ),
        AutoRoute(
          path: ShippingAddressRouters.editShippingAddress,
          page: EditShippingAddressPage,
          name: "EditShippingAddressRoute",
        ),
      ]);
  static showAddShippingAddress(BuildContext context) {
    context.read<ShippingAddressBloc>().initialState();
    context.router.push(const AddShippingAddressRoute());
  }

  static showEditShippingAddress(BuildContext context,
      {required XShippingAddress data}) {
    context.read<ShippingAddressBloc>().getDetailShippingAddress(data: data);
    context.router.push(EditShippingAddressRoute(data: data));
  }
}
