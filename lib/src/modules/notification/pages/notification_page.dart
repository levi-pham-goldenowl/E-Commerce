import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/notification/logic/notification_bloc.dart';
import 'package:e_commerce/src/modules/notification/widgets/card_notification.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        final _items = (state.items.data ?? []).reversed.toList();
        XHandle _handle = XHandle.result(XResult.success(_items));
        if (_handle.isCompleted) {
          return Scaffold(
              appBar: XDefaultAppBar(
                  title: 'Notification',
                  actions: [_clearTextButton()],
                  style: const TextStyle(color: MyColors.colorBlack)),
              body: _items.isEmpty
                  ? const Center(child: Text('Empty list'))
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: CardNotification(data: _items[index]));
                      },
                      itemCount: _items.length,
                    ));
        } else if (_handle.isLoading) {
          return const XStateLoadingWidget();
        } else {
          return const XStateErrorWidget();
        }
      },
    );
  }

  Widget _clearTextButton() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'Clear all',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 13,
              height: 1,
              fontWeight: FontWeight.w600),
        ));
  }
}
