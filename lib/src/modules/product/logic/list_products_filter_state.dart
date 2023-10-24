part of 'list_products_filter_bloc.dart';

class ListProductsFilterState extends Equatable {
  final XHandle<List<XProduct>> items;
  final XHandle<List<XProduct>> searchList;
  final String searchText;

  final ViewType viewType;
  final SortBy sortBy;
  final SizeType sizeType;
  final ColorType colorType;

  const ListProductsFilterState(
      {required this.items,
      this.colorType = ColorType.black,
      this.sortBy = SortBy.lowToHigh,
      this.viewType = ViewType.listView,
      this.sizeType = SizeType.xs,
      required this.searchList,
      this.searchText = ''});

  @override
  List<Object?> get props => [
        items,
        searchList,
        searchText,
        sortBy,
        sizeType,
        viewType,
        colorType,
      ];

  ListProductsFilterState copyWithItem(
      {XHandle<List<XProduct>>? items,
      XHandle<List<XProduct>>? searchList,
      SortBy? sortBy,
      ViewType? viewType,
      SizeType? sizeType,
      ColorType? colorType,
      String? searchText}) {
    return ListProductsFilterState(
        items: items ?? this.items,
        searchText: searchText ?? this.searchText,
        searchList: searchList ?? this.searchList,
        sortBy: sortBy ?? this.sortBy,
        viewType: viewType ?? this.viewType,
        sizeType: sizeType ?? this.sizeType,
        colorType: colorType ?? this.colorType);
  }
}
