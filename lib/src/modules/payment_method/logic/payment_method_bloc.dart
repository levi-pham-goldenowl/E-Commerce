import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/enum/payment_type.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_method_state.dart';

class PaymentMethodBloc extends Cubit<PaymentMethodState> {
  PaymentMethodBloc() : super(const PaymentMethodState());

  Domain domain = Domain();

  void changeName(String name) =>
      emit(state.copyWith(name: name, pureName: true));
  void changeNumberCard(String number) =>
      emit(state.copyWith(cardNumber: number, pureCardNumber: true));
  void changeExpireDate(String expireDate) =>
      emit(state.copyWith(expireDate: expireDate, pureExpireDate: true));

  void changeCVV(String cvv) => emit(state.copyWith(cvv: cvv, pureCVV: true));
  void changeType(PaymentType type) => emit(state.copyWith(paymentType: type));
  void changeDefault(bool setDefault) =>
      emit(state.copyWith(setDefault: setDefault));

  Future<void> addPaymentMethod(BuildContext context) async {
    XSnackBar.showLoading();

    if (state.isValidAddCard) {
      var id = XUtils.getRandomString(10);
      final data = XPaymentMethod(
        name: state.name,
        cardNumber: int.parse(state.cardNumber),
        expireDate: state.expireDate,
        id: id,
        setDefault: state.setDefault,
        type: state.paymentType == PaymentType.mastercard ? 0 : 1,
        cvv: int.parse(state.cvv),
      );

      var value = await domain.paymentMethod.addPaymentMethod(data);
      var valueUpdate = await domain.paymentMethod.updatePaymentMethod(data);

      if (value.isSuccess && valueUpdate.isSuccess) {
        final List<XPaymentMethod> items = [...(state.items ?? []), data];

        emit(state.copyWith(items: items));

        context
            .read<AccountBloc>()
            .setDataLogin(context, user: valueUpdate.data);
        XCoordinator.pop(context);
        XSnackBar.show(msg: "Create success");
      } else {
        XSnackBar.show(msg: "Create failure");
      }
    }
    XSnackBar.hideLoading();
  }

  void initialState() => emit((const PaymentMethodState()));
  Future<void> removePayment(BuildContext context,
      {required XPaymentMethod data}) async {
    XSnackBar.showLoading();

    var value = await domain.paymentMethod.removePaymentMethod(data);

    if (value.isSuccess) {
      final List<XPaymentMethod> items = [...(state.items ?? [])];
      items.remove(data);

      emit(state.copyWith(items: items));

      context.read<AccountBloc>().setDataLogin(context, user: value.data);

      XSnackBar.show(msg: "Remove success");
    } else {
      XSnackBar.show(msg: "Remove failure");
    }
    XSnackBar.hideLoading();
  }

  Future<void> changeDefaultPayment(BuildContext context,
      {required String id, required XPaymentMethod data}) async {
    final xPaymentMethod = XPaymentMethod(
      name: data.name,
      cardNumber: data.cardNumber,
      expireDate: data.expireDate,
      id: id,
      setDefault: !data.setDefault,
      cvv: data.cvv,
      type: data.type,
    );

    var value = await domain.paymentMethod.updatePaymentMethod(xPaymentMethod);

    if (value.isSuccess) {
      final List<XPaymentMethod> items = [...(state.items ?? [])];

      emit(state.copyWith(items: items));

      context.read<AccountBloc>().setDataLogin(context, user: value.data);
    }
  }
}
