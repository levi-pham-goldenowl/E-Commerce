import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/modules/product_details/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/product_details/router/product_details_router.dart';
import 'package:e_commerce/src/modules/product_details/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
        builder: (context, state) {
      return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, productState) {
          var items = state.items.data ?? [];
          items.shuffle();
          XHandle handle = XHandle.result(XResult.success(items));
          if (handle.isCompleted) {
            return SizedBox(
              height: 294,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _header(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: XProductCardVertical(
                                  data: items[index],
                                  onTap: () => ProductDetailsCoordinator
                                      .showRelatedProduct(context,
                                          data: items[index])),
                            );
                          },
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5),
                    ),
                  ),
                ],
              ),
            );
          } else if (handle.isLoading) {
            return const XStateLoadingWidget();
          } else {
            return const XStateErrorWidget();
          }
        },
      );
    });
  }

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'You can also like this',
          style: TextStyle(
              height: 1.42,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyColors.colorBlack),
        ),
        Text('5 items',
            style: TextStyle(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: MyColors.colorGray))
      ],
    );
  }
}
