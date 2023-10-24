import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/checkout/widgets/submit_button.dart';
import 'package:e_commerce/src/modules/checkout/widgets/sums_widget.dart';
import 'package:e_commerce/src/modules/delivery/widgets/delivery_method_widget.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/payment_widget.dart';
import 'package:e_commerce/src/modules/shipping_address/shipping_addresses/widgets/shipping_address_widget.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XDefaultAppBar(
        backgroundColor: MyColors.colorWhite,
        elevation: 1,
        title: 'Checkout',
        style: TextStyle(
            color: MyColors.colorBlack,
            height: 1.42,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            ShippingAddressWidget(),
            PaymentWidget(),
            DeliveryMethodWidget(),
            SumsWidget(),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}
