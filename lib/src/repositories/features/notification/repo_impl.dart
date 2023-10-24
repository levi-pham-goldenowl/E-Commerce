import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/repositories/features/notification/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/notification_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<XResult<List<XMessage>>> getAllNotifications() async {
    try {
      final User? user = AuthService().currentUser;
      var data = await NotificationCollectionReference(id: user?.uid ?? 'N/A')
          .getAllNotifications();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XMessage>> addNotification(XMessage message) async {
    try {
      final User? user = AuthService().currentUser;

      var data = await NotificationCollectionReference(id: user?.uid ?? 'N/A')
          .addNotification(message: message);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
