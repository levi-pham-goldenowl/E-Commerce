import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class InitialLoader extends StatelessWidget {
  const InitialLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
            child: CircularProgressIndicator(
          color: MyColors.colorPrimary,
        )),
      ),
    );
  }
}
