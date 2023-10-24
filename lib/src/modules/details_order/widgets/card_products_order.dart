import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product/widgets/display_size_and_color.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';

class XProductCardOrder extends StatelessWidget {
  final XProduct data;
  const XProductCardOrder({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _priceProduct(XProduct data) => data.discount == 0.0
        ? XUtils.formatPrice(data.originalPrice)
        : XUtils.formatPrice(data.currentPrice ?? -1);
    return Container(
      height: 104,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.colorWhite,
          boxShadow: const [
            BoxShadow(
                blurRadius: 25,
                offset: Offset(0, 1),
                color: MyColors.colorWhite,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 104,
            width: 104,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(data.image ?? "N/A"),
              ),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 11, bottom: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.type,
                    style: const TextStyle(
                        fontSize: 16,
                        color: MyColors.colorBlack,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    data.name,
                    style: const TextStyle(
                        fontSize: 11,
                        color: MyColors.colorGray,
                        fontWeight: FontWeight.normal),
                  ),
                  XDisplaySizeAndColor(data: data),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Units: ',
                            style: const TextStyle(
                                fontSize: 11,
                                height: 1,
                                fontWeight: FontWeight.normal,
                                color: MyColors.colorGray),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${data.amount}',
                                  style: const TextStyle(
                                      color: MyColors.colorBlack)),
                            ],
                          ),
                        ),
                      ),
                      Text('${_priceProduct(data)}\$',
                          style: const TextStyle(
                              height: 1,
                              color: MyColors.colorBlack,
                              fontWeight: FontWeight.w500,
                              fontSize: 14))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
