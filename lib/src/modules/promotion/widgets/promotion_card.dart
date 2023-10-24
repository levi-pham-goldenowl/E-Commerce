import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromotionCard extends StatelessWidget {
  final XPromotion data;
  final bool isShowApply;
  const PromotionCard({Key? key, required this.data, this.isShowApply = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 343,
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.image),
                  ),
                ),
              ),
              _customTextDiscount(
                  discount: data.discount,
                  textColor: data.name.contains("Summer")
                      ? MyColors.colorBlack
                      : MyColors.colorWhite)
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 14,
                            height: 1.42,
                            color: MyColors.colorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        data.code,
                        style: const TextStyle(
                            fontSize: 11,
                            color: MyColors.colorBlack,
                            height: 1,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.timeRemaining.toString() + ' day remaining',
                        style: const TextStyle(
                            fontSize: 11,
                            height: 1,
                            color: MyColors.colorGray,
                            fontWeight: FontWeight.normal),
                      ),
                      isShowApply
                          ? XButton(
                              label: 'Apply',
                              height: 36,
                              onPressed: () => context
                                  .read<PromotionBloc>()
                                  .changedPromoCode(context, code: data.code),
                              width: 93,
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _customTextDiscount(
    {required double discount, Color textColor = MyColors.colorWhite}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(XUtils.formatPrice(discount),
          style: TextStyle(
              color: textColor,
              height: 1,
              fontSize: 34,
              fontWeight: FontWeight.bold)),
      RichText(
        text: TextSpan(
          text: '%\n',
          style: TextStyle(
              color: textColor,
              height: 1,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          children: const <TextSpan>[
            TextSpan(
              text: 'off',
            )
          ],
        ),
      )
    ],
  );
}
