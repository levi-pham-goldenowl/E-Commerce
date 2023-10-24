import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class ButtonsBottomOrder extends StatelessWidget {
  const ButtonsBottomOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttonReorder(context),
              XButton(
                label: 'Leave feedback',
                height: 36,
                width: 150,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    ));
  }

  Widget _buttonReorder(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: MyColors.colorPrimary,
            shadowColor: MyColors.colorWhite.withOpacity(0.7),
            primary: MyColors.colorWhite),
        onPressed: () => {},
        child: const Text('Reorder',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.colorBlack)),
      ),
    );
  }
}
