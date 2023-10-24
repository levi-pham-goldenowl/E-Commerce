import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';

part 'view_all_products_state.dart';

class ViewAllProductsBloc extends ListProductsFilterBloc<ViewAllProductsState> {
  ViewAllProductsBloc()
      : super(ViewAllProductsState(
            listProducts: XHandle.initial(),
            items: XHandle.completed([]),
            searchList: XHandle.completed([])));

  @override
  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.listProducts.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query));
  }
}
