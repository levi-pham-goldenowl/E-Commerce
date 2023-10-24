import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final Exception exception;

  const ErrorDisplay({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error occurred: $exception'));
  }
}
