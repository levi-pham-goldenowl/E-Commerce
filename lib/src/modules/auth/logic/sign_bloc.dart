import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_state.dart';

class SignBloc<T extends SignState> extends Cubit<T> {
  SignBloc(T initialState) : super(initialState);
  final Domain domain = Domain();

  void changedEmail(String email) {
    emit(state.copyWith(email: email.trim(), pureEmail: true) as T);
  }

  void changedPassword(String password) {
    emit(state.copyWith(password: password.trim(), purePassword: true) as T);
  }

  void withGoogle(BuildContext context) async {
    String messageError = "";
    emit(state.copyWith(messageError: messageError) as T);
    XSnackBar.showLoading();

    try {
      var value = await domain.sign.loginWithGoogle();

      if (value.isSuccess) {
        context.read<AccountBloc>().setDataLogin(context, user: value.data!);
        XCoordinator.showDashboard();
        XSnackBar.show(msg: "Logged in successfully");
      } else {
        emit(state.copyWith(messageError: value.error) as T);
      }
    } catch (e) {
      XSnackBar.hideLoading();
      emit(state.copyWith(messageError: "Please try again.") as T);
    }
    XSnackBar.hideLoading();
  }
}
