import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/detail_category/logic/paginate_search_products_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/widgets/header/header_search.dart';
import 'package:e_commerce/src/widgets/paginate/custom_paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsByCategoryPage extends StatelessWidget {
  const SearchProductsByCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginateSearchProductsBloc(),
      child:
          BlocBuilder<PaginateSearchProductsBloc, PaginateSearchProductsState>(
        builder: (context, paginateState) {
          return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
              builder: (context, state) {
            final List<XProduct> _items =
                ((paginateState.docs.data as List<DocumentSnapshot>?) ?? [])
                    .map((e) => e.data() as XProduct)
                    .toList();
            return Scaffold(
                body: CustomPaginate(
                    fetchFirstData: () => context
                        .read<PaginateSearchProductsBloc>()
                        .fetchFirstData(),
                    fetchNextData: () => context
                        .read<PaginateSearchProductsBloc>()
                        .fetchNextData(),
                    paginate: paginateState.docs,
                    body: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                        leading: Image.network(
                          _items[index].image ?? '',
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),
                        onTap: () => DashboardCoordinator.showDetailsProduct(
                            context,
                            data: _items[index],
                            id: _items[index].id),
                        title: Text(_items[index].name),
                        subtitle: Text(_items[index].type),
                      );
                    }, childCount: _items.length)),
                    header: _header(context)));
          });
        },
      ),
    );
  }

  Widget _header(BuildContext context) {
    return BlocBuilder<PaginateSearchProductsBloc, PaginateSearchProductsState>(
      builder: (context, state) {
        return SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: XHeaderDelegateSearch(
            value: state.name ?? '',
            onChanged: (value) =>
                context.read<PaginateSearchProductsBloc>().changeName(value),
          ),
        );
      },
    );
  }
}
