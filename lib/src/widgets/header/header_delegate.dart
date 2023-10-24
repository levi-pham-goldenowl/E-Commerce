import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/order/widgets/tag_chip_status_order.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:e_commerce/src/utils/enum/order_status.dart';
import 'package:e_commerce/src/widgets/chip/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Function()? onPressedSearch;
  final bool isShowTagChipCategories;
  final bool isShowFilterBar;
  final Widget? filterBarWidget;
  final Color backgroundColor;
  final double elevation;
  final bool isShowTagChipStatusOrder;
  final bool? leading;
  final double paddingHori;

  const XHeaderDelegate(
      {required this.title,
      this.onPressedSearch,
      this.filterBarWidget,
      this.elevation = 0,
      this.paddingHori = 16,
      this.isShowTagChipStatusOrder = false,
      this.backgroundColor = MyColors.colorWhite,
      this.isShowFilterBar = false,
      this.leading = false,
      this.isShowTagChipCategories = false});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    const paddingAppbar = kToolbarHeight;
    return Material(
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: progress,
              child: const ColoredBox(
                color: MyColors.colorWhite,
              ),
            ),
            AppBar(
              leading: leading == true
                  ? BackButton(
                      onPressed: () => XCoordinator.pop(context),
                    )
                  : null,
              backgroundColor: backgroundColor,
              actions: [
                IconButton(
                    icon: const Icon(Icons.search),
                    color: MyColors.colorBlack,
                    onPressed: onPressedSearch ?? () {})
              ],
              elevation: elevation,
            ),
            Container(
              padding: EdgeInsets.lerp(
                EdgeInsets.fromLTRB(paddingHori, paddingAppbar, paddingHori, 0),
                const EdgeInsets.only(top: 15, bottom: 10),
                progress,
              ),
              alignment: Alignment.lerp(
                Alignment.topLeft,
                Alignment.topCenter,
                progress,
              ),
              child: Opacity(
                opacity: shrinkOffset > 1 && shrinkOffset < 100 ? progress : 1,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle.lerp(
                    Theme.of(context).textTheme.headlineLarge,
                    Theme.of(context).textTheme.headlineSmall,
                    progress,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.lerp(
                EdgeInsets.zero,
                EdgeInsets.zero,
                progress,
              ),
              alignment: Alignment.lerp(
                Alignment.topCenter,
                Alignment.center,
                progress,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isShowTagChipCategories
                        ? BlocBuilder<CategoriesBloc, CategoriesState>(
                            builder: (context, state) {
                            var items = state.items.data ?? [];

                            return SizedBox(
                              height: 40,
                              child: ListView.builder(
                                itemCount: items.length,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TagChip(
                                    label: items[index].name,
                                    onPressed: () =>
                                        ShopCoordinator.switchCategory(context,
                                            nameCategory: items[index].name),
                                  );
                                },
                              ),
                            );
                          })
                        : const SizedBox.shrink(),
                    isShowTagChipStatusOrder
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                            child: SizedBox(
                                height: 40,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          child: TagChipStatusOrder(
                                              onPressed: () {},
                                              label: OrderStatus.delivered
                                                  .value())),
                                      Center(
                                        child: Text(
                                          OrderStatus.processing.value(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: MyColors.colorBlack,
                                              fontSize: 14,
                                              height: 1,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          OrderStatus.cancelled.value(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: MyColors.colorBlack,
                                              fontSize: 14,
                                              height: 1,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ])),
                          )
                        : const SizedBox.shrink(),
                    isShowFilterBar
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(14, 5, 14, 0),
                            child: filterBarWidget)
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent {
    double extent = 130;
    if ((isShowTagChipCategories || isShowTagChipStatusOrder) &&
        isShowFilterBar) {
      extent = 200;
    } else {
      extent = 170;
    }

    return extent;
  }

  @override
  double get minExtent {
    double extent = 70;
    if ((isShowTagChipStatusOrder || isShowTagChipCategories) &&
        isShowFilterBar) {
      extent = 151;
    } else {
      extent = 110;
    }

    return extent;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
