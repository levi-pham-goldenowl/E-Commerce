import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';

abstract class SignRepository {
  Future<XResult<XUser>> loginWithEmail(
      {required String email, required String password});
  Future<XResult<XUser>> signUp(
      {required String email, required String password, required String name});
  Future<XResult<XUser>> loginWithGoogle();
  Future<XResult> logout();
}
