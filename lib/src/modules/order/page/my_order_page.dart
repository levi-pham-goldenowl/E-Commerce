import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/modules/order/widgets/card_order.dart';
import 'package:e_commerce/src/widgets/header/header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final List<XOrder> _items = state.listOrder.reversed.toList();
        return Scaffold(
          backgroundColor: MyColors.colorBackground,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              Theme(
                data: ThemeData(
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: MyColors.colorBlack),
                  ),
                  textTheme: Theme.of(context).textTheme,
                ),
                child: const SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: XHeaderDelegate(
                      isShowTagChipStatusOrder: true,
                      title: 'My Order',
                      leading: true,
                      backgroundColor: MyColors.colorBackground),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 24),
                      child: CardOrder(data: _items[index]));
                }, childCount: _items.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
