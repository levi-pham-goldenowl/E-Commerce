import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/shipping_address/logic/shipping_address_bloc.dart';
import 'package:e_commerce/src/modules/shipping_address/router/shipping_address_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardShippingAddresses extends StatelessWidget {
  const CardShippingAddresses({Key? key, required this.data}) : super(key: key);
  final XShippingAddress data;

  @override
  Widget build(BuildContext context) {
    final _address = '${data.city}, ${data.province}, ${data.country}';
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 23, 0),
      height: 140,
      decoration: BoxDecoration(
          color: MyColors.colorWhite,
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                offset: const Offset(0, 1),
                color: MyColors.colorWhite.withOpacity(0.08),
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(data.name,
                    style: const TextStyle(
                        fontSize: 14,
                        color: MyColors.colorBlack,
                        fontWeight: FontWeight.w500,
                        height: 1.42)),
                const Spacer(),
                TextButton(
                    onPressed: () =>
                        ShippingAddressCoordinator.showEditShippingAddress(
                            context,
                            data: data),
                    child: const Text('Edit',
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColors.colorPrimary,
                            fontWeight: FontWeight.w500,
                            height: 1.42))),
                TextButton(
                    onPressed: () => context
                        .read<ShippingAddressBloc>()
                        .removeAddress(context, data: data),
                    child: const Text('Remove',
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColors.colorPrimary,
                            fontWeight: FontWeight.w500,
                            height: 1.42)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
            child: RichText(
              text: TextSpan(
                text: '${data.address}\n',
                style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                    color: MyColors.colorBlack),
                children: <TextSpan>[
                  TextSpan(
                    text: _address,
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: _shippingAddressDefault(context))
        ],
      ),
    );
  }

  Widget _shippingAddressDefault(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: data.setDefault,
              activeColor: MyColors.colorBlack,
              onChanged: (value) => context
                  .read<ShippingAddressBloc>()
                  .changeDefaultAddress(context, id: data.id, data: data),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            const Text(
              'Use as the shipping address',
              style: TextStyle(
                  color: MyColors.colorBlack,
                  height: 1.42,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            )
          ],
        );
      },
    );
  }
}
