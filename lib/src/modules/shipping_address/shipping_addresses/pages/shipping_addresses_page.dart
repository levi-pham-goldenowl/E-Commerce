import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/cart/widgets/icon_circle_button.dart';
import 'package:e_commerce/src/modules/shipping_address/router/shipping_address_router.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/widgets/card_shipping_addresses.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressesPage extends StatelessWidget {
  const ShippingAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        final List<XShippingAddress> _items =
            state.data.shippingAddresses ?? [];
        return Scaffold(
          appBar: XDefaultAppBar(
              leading: BackButton(onPressed: () => XCoordinator.pop(context)),
              backgroundColor: MyColors.colorBackground,
              elevation: 1,
              title: 'Shipping Addresses',
              style: XStyle.textTheme().headlineSmall),
          body: _items.isEmpty
              ? const Center(
                  child: Text('Empty'),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: CardShippingAddresses(
                            data: _items[index],
                          ));
                    },
                    itemCount: _items.length,
                    padding: const EdgeInsets.only(top: 36),
                  ),
                ),
          floatingActionButton: IconCircleButton(
            icon: const Icon(Icons.add, color: MyColors.colorWhite),
            primary: MyColors.colorBlack,
            onPressed: () =>
                ShippingAddressCoordinator.showAddShippingAddress(context),
            onPrimary: MyColors.colorWhite,
          ),
        );
      },
    );
  }
}
