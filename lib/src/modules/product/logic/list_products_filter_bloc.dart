import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_products_filter_state.dart';

class ListProductsFilterBloc<T extends ListProductsFilterState>
    extends Cubit<T> {
  ListProductsFilterBloc(T initialState) : super(initialState) {
    getProduct();
  }
  final Domain domain = Domain();

  Future<void> getProduct() async {
    final product = await domain.product.getProduct();
    if (product.isSuccess) {
      emit(state.copyWithItem(items: XHandle.completed(product.data ?? []))
          as T);
    }
  }

  Future<void> addProduct() async {
    final product = await domain.product.addProduct();

    emit(state.copyWithItem(items: XHandle.completed(product.data ?? [])) as T);
  }

  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.items.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query) as T);
  }

  void sortBy(int index) {
    emit(state.copyWithItem(sortBy: SortBy.values[index]) as T);
  }

  void changeViewType() {
    var viewType = state.viewType == ViewType.listView
        ? ViewType.gridView
        : ViewType.listView;
    emit(state.copyWithItem(viewType: viewType) as T);
  }

  void onSelectSize(int index) {
    emit(state.copyWithItem(sizeType: SizeType.values[index]) as T);
  }

  void initSizeType() async {
    await Future.delayed(Duration.zero);
    emit(state.copyWithItem(sizeType: SizeType.xs) as T);
  }
}
