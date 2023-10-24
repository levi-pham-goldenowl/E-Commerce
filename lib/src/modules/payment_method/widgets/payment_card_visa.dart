import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCardVisa extends StatelessWidget {
  const PaymentCardVisa({Key? key, required this.data}) : super(key: key);
  final XPaymentMethod data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () =>
          context.read<PaymentMethodBloc>().removePayment(context, data: data),
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
            color: MyColors.colorGray,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                MyImages.visaCardPayment,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '* * * *  * * * *  * * * *  ${data.cardNumber.toString().lastChars(4)}',
              style: const TextStyle(
                  fontSize: 22,
                  color: MyColors.colorWhite,
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
            Image.asset(
              MyImages.chipCardPayment,
              fit: BoxFit.cover,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Card Holder Name\n',
                    style: const TextStyle(
                        fontSize: 10,
                        height: 1.42,
                        fontWeight: FontWeight.w600,
                        color: MyColors.colorWhite),
                    children: <TextSpan>[
                      TextSpan(
                          text: data.name,
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Expiry Date\n',
                    style: const TextStyle(
                        fontSize: 10,
                        height: 1.42,
                        fontWeight: FontWeight.w600,
                        color: MyColors.colorWhite),
                    children: <TextSpan>[
                      TextSpan(
                          text: data.expireDate,
                          style: const TextStyle(
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
