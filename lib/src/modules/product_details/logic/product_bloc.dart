import 'package:e_commerce/src/models/products_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductBloc extends Cubit<ProductState> {
  ProductBloc(ProductState initialState) : super(initialState);

  void getProductDetails({required XProduct product}) {
    emit(state.copyWith(product: product));
  }
}
