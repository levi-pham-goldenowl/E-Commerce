part of 'view_all_products_bloc.dart';

class ViewAllProductsState extends ListProductsFilterState {
  final XHandle<List<XProduct>> listProducts;

  const ViewAllProductsState(
      {required XHandle<List<XProduct>> items,
      required this.listProducts,
      String searchText = '',
      required XHandle<List<XProduct>> searchList,
      SortBy sortBy = SortBy.lowToHigh,
      ColorType colorType = ColorType.black,
      SizeType sizeType = SizeType.xs,
      ViewType viewType = ViewType.listView})
      : super(
            items: items,
            colorType: colorType,
            searchList: searchList,
            searchText: searchText,
            sizeType: sizeType,
            sortBy: sortBy,
            viewType: viewType);

  @override
  List<Object?> get props => [
        items.data,
        sortBy,
        viewType,
        sizeType,
        searchList,
        searchText,
        listProducts,
      ];
  @override
  ViewAllProductsState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      XHandle<List<XProduct>>? listProducts,
      String? searchText,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      SortBy? sortBy}) {
    return ViewAllProductsState(
      listProducts: listProducts ?? this.listProducts,
      searchList: searchList ?? this.searchList,
      searchText: searchText ?? this.searchText,
      items: items ?? this.items,
      sizeType: sizeType ?? this.sizeType,
      sortBy: sortBy ?? this.sortBy,
      viewType: viewType ?? this.viewType,
      colorType: colorType ?? this.colorType,
    );
  }
}
