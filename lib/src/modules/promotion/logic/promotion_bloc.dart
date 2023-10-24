import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'promotion_state.dart';

class PromotionBloc extends Cubit<PromotionState> {
  PromotionBloc() : super(PromotionState(items: XHandle.completed([]))) {
    getPromotions();
  }
  final Domain domain = Domain();

  Future<void> getPromotions() async {
    final product = await domain.promotion.getPromotions();
    if (product.isSuccess) {
      emit(state.copyWithItem(items: XHandle.completed(product.data ?? [])));
    }
  }

  Future<void> addPromotions() async {
    final product = await domain.promotion.addPromotions();

    emit(state.copyWithItem(items: XHandle.completed(product.data ?? [])));
  }

  void changedPromoCode(BuildContext context, {required String code}) {
    emit(state.copyWithItem(promoCode: code.trim()));
    context.read<OrderBloc>().changePromo(state.promotion);
  }
}
