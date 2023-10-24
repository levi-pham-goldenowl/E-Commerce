part of 'paginate_detail_category_bloc.dart';

class PaginateDetailCategoryState<T> extends PaginateState<T> {
  const PaginateDetailCategoryState(XPaginate<T> docs,
      {required this.productType})
      : super(docs);
  final ProductType productType;

  @override
  List<Object?> get props => [docs, productType];
  @override
  PaginateDetailCategoryState<T> copyWithItem(XPaginate<T> docs,
      {ProductType? productType}) {
    return PaginateDetailCategoryState(docs,
        productType: productType ?? this.productType);
  }
}
