import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationCollectionReference
    extends BaseCollectionReference<XMessage> {
  final String id;
  NotificationCollectionReference({required this.id})
      : super(FirebaseFirestore.instance
            .collection('User/$id/Notifications')
            .withConverter<XMessage>(
              fromFirestore: (snapshot, _) => XMessage.formDocument(snapshot),
              toFirestore: (message, _) => message.toJson(),
            ));

  Future<XResult<List<XMessage>>> getAllNotifications() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XMessage>> addNotification({required XMessage message}) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        ref.add(message);

        return XResult.success(message);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
