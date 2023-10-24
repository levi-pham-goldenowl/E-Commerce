import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState(data: XUser.empty()));

  final Domain domain = Domain();

  Future<void> uploadAvatar(BuildContext context, XFile image) async {
    XSnackBar.showLoading();
    var value = await domain.profile.uploadAvatar(image);
    if (value.isSuccess) {
      context.read<AccountBloc>().setDataLogin(context, user: value.data);
      emit(state.copyWith(data: value.data));
      XSnackBar.show(msg: "Upload photo successfully");
    } else {
      XSnackBar.show(msg: "Photo upload failed");
    }
    XSnackBar.hideLoading();
  }
}
