import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/cart/widgets/icon_circle_button.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/router/payment_method_router.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_card_master.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_card_visa.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        final _items = state.data.paymentMethods ?? [];
        return Scaffold(
          appBar: XDefaultAppBar(
              backgroundColor: MyColors.colorBackground,
              elevation: 1,
              title: 'Payment methods',
              style: XStyle.textTheme().headlineSmall),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    'Your payment cards',
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        fontSize: 16,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                _items.isEmpty
                    ? const Center(
                        child: Text('Empty'),
                      )
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  _items[index].type == 0
                                      ? PaymentCardMaster(data: _items[index])
                                      : PaymentCardVisa(data: _items[index]),
                                  _paymentMethodDefault(context,
                                      data: _items[index]),
                                ],
                              ),
                            );
                          },
                          itemCount: _items.length,
                        ),
                      ),
              ],
            ),
          ),
          floatingActionButton: IconCircleButton(
            icon: const Icon(Icons.add, color: MyColors.colorWhite),
            primary: MyColors.colorBlack,
            onPressed: () =>
                PaymentMethodCoordinator.showBottomSheetNewPayment(context),
            onPrimary: MyColors.colorWhite,
          ),
        );
      },
    );
  }

  Widget _paymentMethodDefault(BuildContext context,
      {required XPaymentMethod data}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: data.setDefault,
          activeColor: MyColors.colorBlack,
          onChanged: (value) => context
              .read<PaymentMethodBloc>()
              .changeDefaultPayment(context, id: data.id, data: data),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        const Text(
          'Use as default payment method',
          style: TextStyle(
              color: MyColors.colorBlack,
              height: 1.42,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
