import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class NotificationRepository {
  Future<XResult<List<XMessage>>> getAllNotifications();
  Future<XResult<XMessage>> addNotification(XMessage message);
}
