import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/cart/widgets/promo_code_widget.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/promotion/widgets/promotion_card.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetPromotion extends StatelessWidget {
  const XBottomSheetPromotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionBloc, PromotionState>(
        builder: (context, state) {
      var items = state.items.data ?? [];
      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Column(
              children: <Widget>[
                PromoCodeWidget(
                  onChanged: (value) => context
                      .read<PromotionBloc>()
                      .changedPromoCode(context, code: value),
                  onPressedArrowIcon: () => XCoordinator.pop(context),
                  value: state.promoCode,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Promo Codes',
                    style: TextStyle(
                        height: 1.42,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: MyColors.colorBlack),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: PromotionCard(
                        data: items[index],
                      ),
                    );
                  },
                  itemCount: items.length,
                )),
              ],
            ),
          ),
        );
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
