import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/features/account/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountRepositoryImpl implements AccountRepository {
  final UserCollectionReference ref = UserCollectionReference();
  @override
  Future<XResult<XUser>> getCurrentUser() async {
    final User? user = AuthService().currentUser;
    if (user != null) {
      return getUserByID(user.uid);
    } else {
      return XResult.error('Not login yet');
    }
  }

  Future<XResult<XUser>> getUserByID(String id) async {
    return ref.get(id);
  }
}
