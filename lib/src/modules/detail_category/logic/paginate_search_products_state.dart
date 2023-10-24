part of 'paginate_search_products_bloc.dart';

class PaginateSearchProductsState<T> extends PaginateState<T> {
  const PaginateSearchProductsState(XPaginate<T> docs, {this.name})
      : super(docs);
  final String? name;
  @override
  List<Object?> get props => [docs, name];
  @override
  PaginateSearchProductsState<T> copyWithItem(XPaginate<T> docs,
      {String? name}) {
    return PaginateSearchProductsState(docs, name: name ?? this.name);
  }
}
