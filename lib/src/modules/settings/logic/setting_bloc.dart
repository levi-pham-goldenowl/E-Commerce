import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingBloc extends AccountBloc<SettingState> {
  SettingBloc(SettingState initialState) : super(initialState);

  void changedName(String name) {
    emit(state.copyWith(name: name.trimLeft(), pureName: true));
  }

  void changedBirthDay(String day) {
    emit(state.copyWith(birthDay: day.trimLeft(), pureBirthDay: true));
  }

  void changedCurrentPassword(String password) {
    emit(state.copyWith(
        currentPassword: password.trimLeft(), pureCurrentPassword: true));
  }

  void changedNewPassword(String password) {
    emit(state.copyWith(
        newPassword: password.trimLeft(), pureNewPassword: true));
  }

  void changedRepeatNewPassword(String password) {
    emit(state.copyWith(
        repeatNewPassword: password.trimLeft(), pureRepeatNewPassword: true));
  }

  void saveChangePassword(BuildContext context) async {
    if (state.isValidChangePassword) {
      var value = await domain.profile.changePassword(
          currentPassword: state.currentPassword,
          newPassword: state.newPassword);

      if (value.isSuccess) {
        XCoordinator.pop(context);
        XSnackBar.show(msg: "Successfully changed password");
      } else {
        XSnackBar.show(msg: "Change password failed");
      }
    } else if (state.newPassword != state.repeatNewPassword) {
      XSnackBar.show(msg: "Password incorrect");
    } else {
      XSnackBar.show(msg: "Please enter information");
    }
  }

  void resetPassword(BuildContext context) async {
    if (state.isValidResetPassword) {
      var value =
          await domain.profile.resetPassword(newPassword: state.newPassword);

      if (value.isSuccess) {
        XCoordinator.pop(context);
        XCoordinator.pop(context);

        XSnackBar.show(msg: "Successfully reset password");
      } else {
        XSnackBar.show(msg: "Reset password failed");
      }
    } else if (state.newPassword != state.repeatNewPassword) {
      XSnackBar.show(msg: "Password incorrect");
    } else {
      XSnackBar.show(msg: "Please enter information");
    }
  }

  void saveInformation(BuildContext context) async {
    if (state.isValidChangeInfo) {
      var value = await domain.profile
          .updateInfo(name: state.name, birthDay: state.birthDay);
      if (value.isSuccess) {
        context.read<AccountBloc>().setDataLogin(context, user: value.data);
        XCoordinator.pop(context);

        XSnackBar.show(msg: "Successfully changed information");
      } else {
        XSnackBar.show(msg: "Change information failed");
      }
    } else {
      XSnackBar.show(msg: "Please enter information");
    }
  }
}
