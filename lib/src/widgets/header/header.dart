import 'package:flutter/material.dart';

class XHeader extends StatelessWidget {
  final String title;
  const XHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
