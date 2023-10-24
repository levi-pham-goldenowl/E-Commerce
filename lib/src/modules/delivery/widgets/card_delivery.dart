import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDeliveryMethod extends StatelessWidget {
  const CardDeliveryMethod({Key? key, required this.data}) : super(key: key);
  final XDeliveryMethod data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryBloc, DeliveryState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context
              .read<DeliveryBloc>()
              .changedDeliveryMethod(context, data: data),
          child: Container(
            height: 72,
            width: 100,
            decoration: BoxDecoration(
                border: state.isSelected(data.id)
                    ? Border.all(color: MyColors.colorPrimary)
                    : null,
                color: MyColors.colorWhite,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 25,
                      offset: const Offset(0, 1),
                      color: MyColors.colorWhite.withOpacity(0.08),
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  data.image,
                  height: 20,
                  width: 70,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  '${data.shippingFromDate}-${data.shippingToDate} days',
                  style: const TextStyle(
                      fontSize: 11,
                      height: 1,
                      color: MyColors.colorGray,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
