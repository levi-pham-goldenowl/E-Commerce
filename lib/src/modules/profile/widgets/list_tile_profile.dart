import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/modules/order/router/order_router.dart';
import 'package:e_commerce/src/modules/profile/router/profile_router.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XFunctionProfile {
  final String title;
  final String subtitle;
  final Function()? onTap;

  XFunctionProfile(
      {required this.title, required this.subtitle, required this.onTap});
}

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, accountState) {
        return BlocBuilder<OrderBloc, OrderState>(
          builder: (context, orderState) {
            return BlocBuilder<PromotionBloc, PromotionState>(
              builder: (context, promotionState) {
                final _subTitleMyOrders = orderState.listOrder.isEmpty
                    ? 'Pay now'
                    : 'Already have ${orderState.listOrder.length} orders';
                final _nameCard = accountState.paymentMethodDefault.type == 1
                    ? "Mater Card"
                    : 'Visa';
                final _subtitlePayment = accountState.paymentMethodDefault.id !=
                        'N/A'
                    ? '$_nameCard **${accountState.paymentMethodDefault.cardNumber.toString().lastChars(2)}'
                    : 'No Card';

                final List<XFunctionProfile> _items = [
                  XFunctionProfile(
                      subtitle: _subTitleMyOrders,
                      title: 'My orders',
                      onTap: () => OrderCoordinator.showMyOrder(context)),
                  XFunctionProfile(
                      subtitle:
                          '${(accountState.data.shippingAddresses ?? []).length} addresses',
                      title: 'Shipping addresses',
                      onTap: () =>
                          DashboardCoordinator.showShippingAddresses(context)),
                  XFunctionProfile(
                      subtitle: _subtitlePayment,
                      title: 'Payment methods',
                      onTap: () =>
                          DashboardCoordinator.showPaymentMethod(context)),
                  XFunctionProfile(
                      subtitle:
                          'You have ${(promotionState.items.data ?? []).length} special promocodes',
                      title: 'Promocodes',
                      onTap: () => ProfileCoordinator.showPromotion(context)),
                  XFunctionProfile(
                      subtitle: 'Reviews for 4 items',
                      title: 'My reviews',
                      onTap: () {}),
                  XFunctionProfile(
                      subtitle: 'Infomation, password',
                      title: 'Settings',
                      onTap: () => ProfileCoordinator.showSetting(context)),
                  XFunctionProfile(
                      subtitle: 'List Notifications',
                      title: 'Notification',
                      onTap: () =>
                          ProfileCoordinator.showNotification(context)),
                  XFunctionProfile(
                      subtitle: 'Log out account',
                      title: 'Logout',
                      onTap: () => context.read<AccountBloc>().logout(context)),
                ];
                return _buildScreen(context, items: _items);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildScreen(BuildContext context,
      {required List<XFunctionProfile> items}) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    final paddingContent = EdgeInsets.fromLTRB(padding, 0, padding, 0);
    return Column(
        children: ListTile.divideTiles(
            color: MyColors.colorGray,
            tiles: items.map((e) => ListTile(
                  dense: true,
                  contentPadding: paddingContent,
                  onTap: () => e.onTap!(),
                  title: Text(e.title,
                      style: const TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: MyColors.colorBlack,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(e.subtitle,
                      style: const TextStyle(
                          fontSize: 11,
                          height: 1,
                          color: MyColors.colorGray,
                          fontWeight: FontWeight.normal)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: MyColors.colorGray,
                  ),
                ))).toList());
  }
}
