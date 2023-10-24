import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/promotion/widgets/promotion_card.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionBloc, PromotionState>(
      builder: (context, state) {
        final _items = state.items.data ?? [];
        return Scaffold(
          appBar: const XDefaultAppBar(
            backgroundColor: MyColors.colorWhite,
            elevation: 1,
            title: 'Promocodes',
            style: TextStyle(
                color: MyColors.colorBlack,
                height: 1.42,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: PromotionCard(
                  data: _items[index],
                  isShowApply: false,
                )),
            itemCount: _items.length,
          ),
        );
      },
    );
  }
}
