import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OrderWrapperPage extends StatelessWidget {
  const OrderWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AutoRouter());
  }
}
