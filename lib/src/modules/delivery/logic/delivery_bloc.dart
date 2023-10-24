import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delivery_state.dart';

class DeliveryBloc extends Cubit<DeliveryState> {
  DeliveryBloc() : super(const DeliveryState(items: [])) {
    getAllDeliveryMethod();
  }

  final Domain domain = Domain();

  Future<void> getAllDeliveryMethod() async {
    final value = await domain.delivery.getAllDeliveryMethod();
    if (value.isSuccess) {
      emit(state.copyWith(items: value.data));
    }
  }

  Future<void> addDeliveryMethod() async {
    final value = await domain.delivery.addDelivery();
    if (value.isSuccess) {
      emit(state.copyWith(items: value.data));
    }
  }

  void changedDeliveryMethod(BuildContext context,
          {required XDeliveryMethod data}) =>
      emit(state.copyWith(deliveryMethodData: data));
}
