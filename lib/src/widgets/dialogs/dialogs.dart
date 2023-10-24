import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/widgets/dialogs/x_alert_dialog.dart';
import 'package:flutter/material.dart';

class XDialog {
  static get context => XCoordinator.context;

  static Future<String?> show({
    String? title,
    String? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          title: title,
          content: body,
          actions: actions,
        );
      },
    );
  }
}
