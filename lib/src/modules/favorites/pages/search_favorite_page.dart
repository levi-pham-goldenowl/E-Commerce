import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/widgets/app_bar/search_app_bar.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFavoritePage extends StatelessWidget {
  const SearchFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      var _items = state.searchList.data ?? [];
      XHandle handle = XHandle.result(XResult.success(_items));
      if (handle.isCompleted) {
        return Scaffold(
            appBar: XSearchAppBar(
              onChanged: (value) =>
                  context.read<FavoriteBloc>().searchProduct(value),
              value: state.searchText,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                final _item = _items[index];

                return ListTile(
                  onTap: () => DashboardCoordinator.showDetailsProduct(context,
                      data: _item, id: _item.id),
                  leading: Image.network(
                    _item.image ?? '',
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(_item.name),
                  subtitle: Text(_item.type),
                );
              },
              itemCount: _items.length,
            ));
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
