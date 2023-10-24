import 'package:e_commerce/src/widgets/text_field/search_text_filed.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/src/config/themes/my_colors.dart';

class XSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(dynamic) onChanged;
  final String value;
  const XSearchAppBar({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: MyColors.colorBlack),
        backgroundColor: MyColors.colorWhite,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: MyColors.colorGray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: SearchTextField(
              onChanged: onChanged,
              value: value,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
