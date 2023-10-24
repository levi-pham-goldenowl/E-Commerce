import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
part 'paginate_search_products_state.dart';

class PaginateSearchProductsBloc extends PaginateBloc<
    PaginateSearchProductsState<DocumentSnapshot<XProduct>>> {
  PaginateSearchProductsBloc()
      : super(PaginateSearchProductsState(XPaginate.initial(), name: ''));
  Domain domain = Domain();

  @override
  Future<void> fetchFirstData() async {
    emit(state.copyWithItem(XPaginate.initial(), name: state.name));

    return fetchNextData();
  }

  @override
  Future<void> fetchNextData() async {
    emit(
      state.copyWithItem(state.docs.loading(), name: state.name),
    );

    final value = await domain.product
        .getNextProductsSearch(name: state.name, lastDoc: state.docs.lastDoc);

    emit(state.copyWithItem(
        state.docs.result(XResult.success(value.data ?? [])),
        name: state.name));
  }

  Future<void> changeName(String name) async {
    emit(state.copyWithItem(XPaginate.initial(), name: name));

    await fetchFirstData();
  }
}
