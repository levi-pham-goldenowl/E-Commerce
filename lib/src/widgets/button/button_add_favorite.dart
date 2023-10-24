import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet_select_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XButtonAddToFavorite extends StatelessWidget {
  final XProduct data;
  const XButtonAddToFavorite({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      return SizedBox(
          width: 36,
          height: 36,
          child: state.hadFavorites(data)
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: MyColors.colorPrimary,
                      primary: MyColors.colorPrimary,
                      onPrimary: MyColors.colorWhite,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      shape: const CircleBorder()),
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage(MyIcons.favoriteWhiteIcon),
                    height: 9,
                    fit: BoxFit.fill,
                  ))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: MyColors.colorWhite,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: MyColors.colorWhite,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      onPrimary: MyColors.colorPrimary,
                      shape: const CircleBorder()),
                  onPressed: () {
                    context.read<FavoriteBloc>().initSizeType();

                    XBottomSheet.show(context,
                        backgroundColor: MyColors.colorBackground,
                        widget: XBottomSheetSelectSize(
                          data: data,
                          pageInfo: PageInfo.favorites,
                        ));
                  },
                  child: const Image(
                    image: AssetImage(MyIcons.favoriteIcon),
                    height: 9,
                    fit: BoxFit.fill,
                  )));
    });
  }
}
