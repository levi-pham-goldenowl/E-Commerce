import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/order/router/order_router.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({Key? key, required this.data}) : super(key: key);
  final XOrder data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19),
      height: 164,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 24,
                offset: const Offset(0, 1),
                color: MyColors.colorWhite.withOpacity(0.12),
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order No${data.id}',
                style: const TextStyle(
                    height: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.colorBlack),
              ),
              Text(
                data.date,
                style: const TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: MyColors.colorGray),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: 'Tracking number:',
                style: const TextStyle(
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.normal,
                    color: MyColors.colorGray),
                children: <TextSpan>[
                  TextSpan(
                      text: data.trackingNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: MyColors.colorBlack)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: RichText(
                  text: TextSpan(
                    text: 'Quantity:',
                    style: const TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontWeight: FontWeight.normal,
                        color: MyColors.colorGray),
                    children: <TextSpan>[
                      TextSpan(
                          text: '${data.listProducts.length}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: MyColors.colorBlack)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: RichText(
                  text: TextSpan(
                    text: 'Total Amount:',
                    style: const TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontWeight: FontWeight.normal,
                        color: MyColors.colorGray),
                    children: <TextSpan>[
                      TextSpan(
                          text: '${XUtils.formatPrice(data.total)}\$',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: MyColors.colorBlack)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttonDetail(context, data: data),
              Text(
                data.status,
                style: const TextStyle(
                    height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.colorGreen),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buttonDetail(BuildContext context, {required XOrder data}) {
    return SizedBox(
      width: 98,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: MyColors.colorPrimary,
            shadowColor: MyColors.colorWhite.withOpacity(0.7),
            primary: MyColors.colorWhite),
        onPressed: () => OrderCoordinator.showDetailsOrder(context, data: data),
        child: const Text('Details',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.colorBlack)),
      ),
    );
  }
}
