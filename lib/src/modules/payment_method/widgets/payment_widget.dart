import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          var paymentMethodDefault = state.paymentMethodDefault;
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Payment',
                        style: TextStyle(
                            height: 1,
                            fontSize: 16,
                            color: MyColors.colorBlack,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () =>
                              DashboardCoordinator.showPaymentMethod(context),
                          child: const Text('Change',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: MyColors.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  height: 1.42)))
                    ],
                  ),
                ),
                paymentMethodDefault.id == 'N/A'
                    ? _emptyPaymentMethod(context)
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          paymentMethodDefault.type == 0
                              ? _logoMaterCard()
                              : _logoVisa(),
                          const SizedBox(
                            width: 17,
                          ),
                          Text(
                            '**** **** **** ${paymentMethodDefault.cardNumber.toString().lastChars(4)}',
                            style: const TextStyle(
                                color: MyColors.colorBlack,
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _emptyPaymentMethod(BuildContext context) {
    return const Text(
      'No payment yet',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _logoMaterCard() {
    return Container(
        height: 38,
        width: 64,
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
        child: Center(
          child: Image.asset(MyImages.masterCardPayment, fit: BoxFit.cover),
        ));
  }

  Widget _logoVisa() {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 38,
        width: 64,
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
        child: Center(
          child: Image.asset(MyImages.visaCardPayment,
              color: Colors.blue, fit: BoxFit.cover),
        ));
  }
}
