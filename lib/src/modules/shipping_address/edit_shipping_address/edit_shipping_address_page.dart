import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/widgets/alert_dialog_country.dart';
import 'package:e_commerce/src/modules/shipping_address/adding_shipping_address/widgets/text_field_shipping_address.dart';
import 'package:e_commerce/src/modules/shipping_address/logic/shipping_address_bloc.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditShippingAddressPage extends StatelessWidget {
  const EditShippingAddressPage({Key? key, required this.data})
      : super(key: key);
  final XShippingAddress data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingAddressBloc, ShippingAddressState>(
      builder: (context, state) {
        return Scaffold(
          appBar: XDefaultAppBar(
              backgroundColor: MyColors.colorBackground,
              elevation: 1,
              title: 'Editing Shipping Address',
              style: XStyle.textTheme().headlineSmall),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 35, 12, 20),
              child: Column(
                children: [
                  XTextFieldShippingAddress(
                    label: 'Full name',
                    onChanged: (value) =>
                        context.read<ShippingAddressBloc>().changeName(value),
                    textInputType: TextInputType.name,
                    errorText: state.isValidName,
                    value: state.name,
                  ),
                  XTextFieldShippingAddress(
                    label: 'Address',
                    onChanged: (value) => context
                        .read<ShippingAddressBloc>()
                        .changeAddress(value),
                    textInputType: TextInputType.streetAddress,
                    errorText: state.isValidAddress,
                    value: state.address,
                  ),
                  XTextFieldShippingAddress(
                    label: 'City',
                    onChanged: (value) =>
                        context.read<ShippingAddressBloc>().changeCity(value),
                    errorText: state.isValidCity,
                    value: state.city,
                  ),
                  XTextFieldShippingAddress(
                    label: 'State/Province/Region',
                    onChanged: (value) => context
                        .read<ShippingAddressBloc>()
                        .changeProvince(value),
                    errorText: state.isValidProvince,
                    value: state.province,
                  ),
                  XTextFieldShippingAddress(
                    label: 'Zip Code (Postal Code)',
                    onChanged: (value) => context
                        .read<ShippingAddressBloc>()
                        .changeZipCode(value),
                    textInputType: TextInputType.number,
                    errorText: state.isValidZipCode,
                    value: state.zipCode,
                  ),
                  XTextFieldShippingAddress(
                    label: 'Country',
                    onChanged: (value) {},
                    errorText: state.isValidCountry,
                    value: state.nameCountry,
                    readOnly: true,
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => alertDialogCountry(context));
                    },
                    isShowPopUp: true,
                  ),
                  XButton(
                    label: 'SAVE CHANGES',
                    height: 48,
                    onPressed: state.isValidSaveAddress
                        ? () => context
                            .read<ShippingAddressBloc>()
                            .updateAddress(context,
                                id: data.id, setDefalut: data.setDefault)
                        : null,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
