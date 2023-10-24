import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationBloc extends Cubit<NotificationState> {
  NotificationBloc() : super(NotificationState(items: XHandle.completed([]))) {
    getAllNotification();
  }
  final Domain domain = Domain();

  Future<void> addNotification(XMessage message) async {
    final value = await domain.notification.addNotification(message);

    if (value.isSuccess) {
      final List<XMessage> items = [...(state.items.data ?? []), message];

      emit(state.copyWith(items: XHandle.completed(items)));
    }
  }

  Future<void> getAllNotification() async {
    final value = await domain.notification.getAllNotifications();

    if (value.isSuccess) {
      List<XMessage> items = [...(value.data ?? [])];

      emit(state.copyWith(items: XHandle.completed(items)));
    }
  }
}
