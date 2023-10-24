import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Text(
          'Loading',
          style: TextStyle(
              color: MyColors.colorPrimary,
              fontSize: 17,
              fontWeight: FontWeight.normal),
        ),
      ),
    ));
  }
}
