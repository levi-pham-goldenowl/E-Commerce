import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/shipping_address/logic/shipping_address_bloc.dart';
import 'package:e_commerce/src/utils/enum/countries_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AlertDialog alertDialogCountry(BuildContext context) {
  return AlertDialog(
      scrollable: true,
      title: const Text('Country'),
      actions: [
        TextButton(
            onPressed: () {
              XCoordinator.pop(context);
            },
            child: const Text('OK'))
      ],
      content: BlocBuilder<ShippingAddressBloc, ShippingAddressState>(
        builder: (context, state) {
          return SizedBox(
              height: 350,
              width: 300.0,
              child: ListView(
                children: ListTile.divideTiles(
                    color: MyColors.colorWhite,
                    tiles: CountriesInfo.values.map((item) {
                      return ListTile(
                        dense: true,
                        selectedColor: MyColors.colorPrimary,
                        selected: item.selectedCountry(state.country),
                        onTap: () => context
                            .read<ShippingAddressBloc>()
                            .changeCountry(item),
                        title: Text(
                          item.value(),
                        ),
                      );
                    })).toList(),
              ));
        },
      ));
}
