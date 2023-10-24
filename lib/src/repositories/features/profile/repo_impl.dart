import 'dart:io';

import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/features/profile/repo.dart';

import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<XResult<XUser>> uploadAvatar(XFile image) async {
    final File imageFile = File(image.path);
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var name = value.data?.name ?? 'N/A';
      var email = value.data?.email ?? 'N/A';
      var id = value.data?.id ?? "N/A";
      var birthDay = value.data?.birthDay;
      var result = await firebase_storage.FirebaseStorage.instance
          .ref('uploads/${image.name}')
          .putFile(imageFile);
      var url = (await result.ref.getDownloadURL()).toString();
      var data = XUser(
          email: email, name: name, id: id, urlAvatar: url, birthDay: birthDay);
      UserCollectionReference().set(data);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XUser>> updateInfo(
      {required String name, required String birthDay}) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var newName = name;
      var email = value.data?.email ?? 'N/A';
      var id = value.data?.id ?? "N/A";
      var url = value.data?.urlAvatar;
      var newBirthDay = birthDay;
      var data = XUser(
          email: email,
          name: newName,
          id: id,
          urlAvatar: url,
          birthDay: newBirthDay);
      UserCollectionReference().set(data);
      return XResult.success(data);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<bool>> changePassword(
      {required String newPassword, required String currentPassword}) async {
    try {
      final user = AuthService().currentUser;
      final cred = EmailAuthProvider.credential(
          email: user?.email ?? "N/A", password: currentPassword);
      await user?.reauthenticateWithCredential(cred);
      await user?.updatePassword(newPassword);

      return XResult.success(true);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<bool>> resetPassword({required String newPassword}) async {
    try {
      final user = AuthService().currentUser;
      await user?.updatePassword(newPassword);

      return XResult.success(true);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
