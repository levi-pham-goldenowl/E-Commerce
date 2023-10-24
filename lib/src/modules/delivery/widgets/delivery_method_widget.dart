import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:e_commerce/src/modules/delivery/widgets/card_delivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryMethodWidget extends StatelessWidget {
  const DeliveryMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<DeliveryBloc, DeliveryState>(
        builder: (context, state) {
          final _items = state.items;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery method',
                  style: TextStyle(
                      height: 1,
                      fontSize: 16,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 72,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _items
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: CardDeliveryMethod(data: e),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
