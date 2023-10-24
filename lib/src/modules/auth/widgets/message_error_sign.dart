import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class MessageErrorSign extends StatelessWidget {
  const MessageErrorSign(
      {Key? key, required this.isError, required this.message})
      : super(key: key);
  final bool isError;
  final String message;

  @override
  Widget build(BuildContext context) {
    return isError
        ? Center(
            child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: MyColors.colorPrimary, fontWeight: FontWeight.w500),
          ))
        : const SizedBox.shrink();
  }
}
