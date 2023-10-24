import 'package:e_commerce/src/models/result.dart';

import 'package:e_commerce/src/models/users_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<XResult<XUser>> uploadAvatar(XFile image);
  Future<XResult<XUser>> updateInfo(
      {required String name, required String birthDay});
  Future<XResult<bool>> changePassword(
      {required String newPassword, required String currentPassword});
  Future<XResult<bool>> resetPassword({required String newPassword});
}
