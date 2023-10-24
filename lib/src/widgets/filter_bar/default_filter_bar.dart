import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';

class XDefaultFilerBar extends StatelessWidget {
  final String sortByText;
  final String iconViewType;
  final Function() onPressedSortBy;
  final Function() onPressedViewType;
  const XDefaultFilerBar(
      {Key? key,
      required this.iconViewType,
      required this.onPressedSortBy,
      required this.onPressedViewType,
      required this.sortByText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      color: MyColors.colorBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: _filter()),
          Expanded(flex: 3, child: _sort()),
          Expanded(child: _viewType())
        ],
      ),
    );
  }

  Widget _filter() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      child: Row(
        children: [
          Image.asset(
            MyIcons.filterIcon,
            color: MyColors.colorBlack,
          ),
          const SizedBox(
            width: 11,
          ),
          const Text(
            'Filter',
            style: TextStyle(
                color: MyColors.colorBlack,
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _sort() {
    return ElevatedButton(
      onPressed: onPressedSortBy,
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            MyIcons.sortIcon,
            color: MyColors.colorBlack,
          ),
          const SizedBox(
            width: 11,
          ),
          Text(
            sortByText,
            style: const TextStyle(
                color: MyColors.colorBlack,
                fontSize: 11,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _viewType() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: MyColors.colorBackground,
          onPrimary: MyColors.colorBackground,
          shadowColor: MyColors.colorWhite,
          elevation: 0),
      onPressed: onPressedViewType,
      child: Row(
        children: [
          Image.asset(
            iconViewType,
            color: MyColors.colorBlack,
          ),
        ],
      ),
    );
  }
}
