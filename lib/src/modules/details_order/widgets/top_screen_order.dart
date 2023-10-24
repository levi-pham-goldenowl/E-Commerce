import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:flutter/material.dart';

class TopScreenOrder extends StatelessWidget {
  const TopScreenOrder({Key? key, required this.data}) : super(key: key);
  final XOrder data;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
        child: Column(
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Tracking number: ',
                      style: const TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorGray),
                      children: <TextSpan>[
                        TextSpan(
                            text: data.trackingNumber,
                            style: const TextStyle(
                                color: MyColors.colorBlack,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Text(
                  data.status,
                  style: const TextStyle(
                      height: 1,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.colorGreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
