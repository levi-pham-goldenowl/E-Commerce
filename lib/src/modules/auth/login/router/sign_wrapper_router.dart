import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SignWrapperPage extends StatelessWidget {
  const SignWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: AutoRouter(),
      ),
    );
  }
}
