import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/logic/sign_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends SignBloc<LoginState> {
  LoginBloc() : super(const LoginState());

  void loginWithEmailAndPassword(BuildContext context) async {
    XSnackBar.showLoading();
    FocusScope.of(context).requestFocus(FocusNode());

    String messageError = "";

    emit(state.copyWith(
        messageError: messageError, purePassword: true, pureEmail: true));

    if (state.isValidLogin) {
      var value = await domain.sign
          .loginWithEmail(email: state.email, password: state.password);
      if (value.isSuccess) {
        context.read<AccountBloc>().setDataLogin(context, user: value.data);
        XCoordinator.showDashboard();
        XSnackBar.show(msg: "Logged in successfully");
      } else {
        emit(state.copyWith(messageError: value.error));
      }
    }

    XSnackBar.hideLoading();
  }
}
