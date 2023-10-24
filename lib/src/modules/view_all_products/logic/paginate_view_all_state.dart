part of 'paginate_view_all_bloc.dart';

class PaginateViewAllState<T> extends PaginateState<T> {
  const PaginateViewAllState(XPaginate<T> docs, {required this.productType})
      : super(docs);
  final ProductType productType;

  @override
  List<Object?> get props => [docs, productType];
  @override
  PaginateViewAllState<T> copyWithItem(XPaginate<T> docs,
      {ProductType? productType}) {
    return PaginateViewAllState(docs,
        productType: productType ?? this.productType);
  }
}
