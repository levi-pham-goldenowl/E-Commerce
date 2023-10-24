import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class AppBarSign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 8,
      shadowColor: MyColors.colorWhite,
      iconTheme: const IconThemeData(color: MyColors.colorBlack),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
