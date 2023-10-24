import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';

part 'paginate_detail_category_state.dart';

class PaginateDetailCategoryBloc extends PaginateBloc<
    PaginateDetailCategoryState<DocumentSnapshot<XProduct>>> {
  PaginateDetailCategoryBloc()
      : super(PaginateDetailCategoryState(XPaginate.initial(),
            productType: ProductType.sale));
  Domain domain = Domain();

  @override
  Future<void> fetchFirstData() async {
    emit(state.copyWithItem(XPaginate.initial()));

    return fetchNextData();
  }

  @override
  Future<void> fetchNextData() async {
    if (state.docs.canNext) {
      emit(
        state.copyWithItem(state.docs.loading()),
      );

      final value = await domain.product.getNextProductsFilter(
          productType: state.productType, lastDoc: state.docs.lastDoc);
      if (value.isSuccess) {
        emit(state.copyWithItem(
            state.docs.result(XResult.success(value.data ?? []))));
      }
    }
  }

  void changeProductType(String productType) =>
      emit(state.copyWithItem(XPaginate.initial(),
          productType: convertStringToProductType(productType)));
}

ProductType convertStringToProductType(String nameProduct) {
  switch (nameProduct) {
    case "Tops":
      return ProductType.top;

    case "Shirts & Blouses":
      return ProductType.shirts;
    case "Cardigans & Sweaters":
      return ProductType.cardigans;
    case "Knitwear":
      return ProductType.knitwear;
    case "Blazers":
      return ProductType.blazers;
    case "Outerwear":
      return ProductType.outerwear;
    case "Pants":
      return ProductType.pants;
    case "Jeans":
      return ProductType.jeans;
    case "Shorts":
      return ProductType.shorts;
    case "Skirts":
      return ProductType.skirts;
    case "Dresses":
      return ProductType.dresses;

    default:
      return ProductType.dresses;
  }
}
