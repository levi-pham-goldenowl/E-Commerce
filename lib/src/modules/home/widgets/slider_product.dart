import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/home/widgets/product_card_home.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderProduct extends StatelessWidget {
  final ProductType productType;
  final Function() onPressedViewAll;
  const SliderProduct({
    Key? key,
    required this.onPressedViewAll,
    required this.productType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
        builder: (context, state) {
      final data = state.items.data ?? [];
      var items = productType.listFilter(data: data);
      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return items.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: 337,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(),
                      const SizedBox(
                        height: 22,
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: XProductCardHome(
                                  data: items[index],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }

  Widget _header() {
    return SizedBox(
        height: 49,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productType.title(),
                  style: const TextStyle(
                      fontSize: 34,
                      height: 1,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  productType.subTile(),
                  style: const TextStyle(
                      fontSize: 11,
                      height: 1,
                      color: MyColors.colorGray,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            TextButton(
                onPressed: onPressedViewAll,
                child: const Text(
                  "View all",
                  style: TextStyle(
                      color: MyColors.colorBlack,
                      fontSize: 11,
                      height: 1,
                      fontWeight: FontWeight.normal),
                ))
          ],
        ));
  }
}
