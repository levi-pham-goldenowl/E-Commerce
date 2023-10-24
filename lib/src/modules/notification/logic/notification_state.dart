part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final XHandle<List<XMessage>> items;

  const NotificationState({required this.items});

  @override
  List<Object?> get props => [items];

  NotificationState copyWith({
    XHandle<List<XMessage>>? items,
  }) {
    return NotificationState(
      items: items ?? this.items,
    );
  }
}
