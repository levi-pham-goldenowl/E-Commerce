import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';

class OrderInfomation extends StatelessWidget {
  const OrderInfomation({Key? key, required this.data}) : super(key: key);
  final XOrder data;

  @override
  Widget build(BuildContext context) {
    final _address =
        '${data.shippingAddressData.address} ,${data.shippingAddressData.city} ,${data.shippingAddressData.province} ,${data.shippingAddressData.country}';
    final _payment =
        '**** **** **** ${data.paymentMethodData.cardNumber.toString().lastChars(4)}';
    final _delivery =
        '${data.deliveryMethodData.name}, ${data.deliveryMethodData.shippingToDate} days, ${XUtils.formatPrice(data.deliveryMethodData.price)}\$';
    final _discount = data.promotionData.discount != 0.0
        ? '${data.promotionData.discount}%, ${data.promotionData.name} code'
        : '';
    const sizedBox = SizedBox(height: 15);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textBold('Order information'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _textNormal('Shipping Address:')),
                Expanded(flex: 6, child: _textBold(_address))
              ],
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 4, child: _textNormal('Payment method:')),
                Expanded(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      data.paymentMethodData.type == 0
                          ? _logoMaterCard()
                          : _logoVisa(),
                      const SizedBox(width: 10),
                      _textBold(_payment)
                    ],
                  ),
                )
              ],
            ),
            sizedBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _textNormal('Delivery method:')),
                Expanded(flex: 6, child: _textBold(_delivery))
              ],
            ),
            sizedBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _textNormal('Discount')),
                Expanded(flex: 6, child: _textBold(_discount))
              ],
            ),
            sizedBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _textNormal('Total Amount')),
                Expanded(flex: 6, child: _textBold('${data.total}\$'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _textBold(String text) {
    return Text(text,
        style: const TextStyle(
            height: 1,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: MyColors.colorBlack));
  }

  Text _textNormal(String text) {
    return Text(
      text,
      style: const TextStyle(
          height: 1,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: MyColors.colorGray),
    );
  }

  Widget _logoMaterCard() {
    return SizedBox(
        height: 38,
        child: Center(
          child: Image.asset(MyImages.masterCardPayment, fit: BoxFit.cover),
        ));
  }

  Widget _logoVisa() {
    return SizedBox(
        height: 38,
        child: Center(
          child: Image.asset(MyImages.visaCardPayment,
              color: Colors.blue, fit: BoxFit.cover),
        ));
  }
}
