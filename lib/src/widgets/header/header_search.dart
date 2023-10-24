import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/widgets/text_field/search_text_filed.dart';
import 'package:flutter/material.dart';

class XHeaderDelegateSearch extends SliverPersistentHeaderDelegate {
  final Function(dynamic) onChanged;
  final String value;
  const XHeaderDelegateSearch(
      {Key? key, required this.onChanged, required this.value});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppBar(
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
                ))
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 90;
  @override
  double get minExtent => 89;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
