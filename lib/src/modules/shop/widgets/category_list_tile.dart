import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';

import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
      List<XCategories> items = state.items.data ?? [];
      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return Column(
            children: ListTile.divideTiles(
                color: MyColors.colorGray,
                tiles: items.map((item) => ListTile(
                      dense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      onTap: () => ShopCoordinator.showProductByCategory(
                          context,
                          nameCategory: item.name),
                      title: Text(item.name,
                          style: const TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: MyColors.colorBlack,
                              fontWeight: FontWeight.normal)),
                    ))).toList());
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
