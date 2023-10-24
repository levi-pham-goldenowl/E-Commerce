import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          var shippingAddressDefault = state.shippingAddressDefault;
          final _address =
              '${shippingAddressDefault.city}, ${shippingAddressDefault.province}, ${shippingAddressDefault.country}';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shipping address',
                  style: TextStyle(
                      height: 1,
                      fontSize: 16,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 23, 0),
                  height: 108,
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
                  child: shippingAddressDefault.id == 'N/A'
                      ? _emptyShippingAddress(context)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(shippingAddressDefault.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: MyColors.colorBlack,
                                        fontWeight: FontWeight.w500,
                                        height: 1.42)),
                                _changeButton(context)
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                text: '${shippingAddressDefault.address}\n',
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.normal,
                                    color: MyColors.colorBlack),
                                children: <TextSpan>[
                                  TextSpan(text: _address),
                                ],
                              ),
                            ),
                          ],
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _emptyShippingAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'No shipping address yet',
              style: TextStyle(color: Colors.black),
            ),
            _changeButton(context)
          ],
        ),
      ],
    );
  }

  Widget _changeButton(BuildContext context) {
    return TextButton(
        onPressed: () => DashboardCoordinator.showShippingAddresses(context),
        child: const Text('Change',
            style: TextStyle(
                fontSize: 14,
                color: MyColors.colorPrimary,
                fontWeight: FontWeight.w500,
                height: 1.42)));
  }
}
