part of 'product_bloc.dart';

class ProductState extends Equatable {
  final XProduct product;
  const ProductState({
    required this.product,
  });

  @override
  List<Object?> get props => [product];

  ProductState copyWith({
    XProduct? product,
  }) {
    return ProductState(
      product: product ?? this.product,
    );
  }
}
