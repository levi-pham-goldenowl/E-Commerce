import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';

part 'paginate_view_all_state.dart';

class PaginateViewAllBloc
    extends PaginateBloc<PaginateViewAllState<DocumentSnapshot<XProduct>>> {
  PaginateViewAllBloc()
      : super(PaginateViewAllState(XPaginate.initial(),
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

      emit(state
          .copyWithItem(state.docs.result(XResult.success(value.data ?? []))));
    }
  }

  void changeProductType(ProductType productType) =>
      emit(state.copyWithItem(XPaginate.initial(), productType: productType));
}
