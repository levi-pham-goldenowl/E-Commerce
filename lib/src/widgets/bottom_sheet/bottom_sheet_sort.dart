import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSort extends StatelessWidget {
  final SortBy sortBy;
  final PageInfo pageInfo;
  const XBottomSheetSort(
      {Key? key, required this.sortBy, required this.pageInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sort by',
            style: XStyle.textTheme().headlineSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: ListTile.divideTiles(
                color: MyColors.colorWhite,
                tiles: SortBy.values.map((item) {
                  return ListTile(
                    dense: true,
                    selectedColor: MyColors.colorPrimary,
                    selectedTileColor: MyColors.colorPrimary,
                    selected: item.sortProductBy(sortBy),
                    onTap: () {
                      switch (pageInfo) {
                        case PageInfo.detailsCategory:
                          context
                              .read<ListProductsFilterBloc>()
                              .sortBy(item.index);

                          break;
                        case PageInfo.home:
                          context
                              .read<ViewAllProductsBloc>()
                              .sortBy(item.index);

                          break;
                        case PageInfo.favorites:
                          context.read<FavoriteBloc>().sortBy(item.index);

                          break;
                        default:
                      }

                      XCoordinator.pop(context);
                    },
                    title: Text(item.value(),
                        style: sortBy.styleOf(item.sortProductBy(sortBy))),
                  );
                })).toList(),
          )
        ],
      ),
    );
  }
}
