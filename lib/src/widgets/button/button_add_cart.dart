import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XButtonAddToCart extends StatelessWidget {
  final XProduct data;
  const XButtonAddToCart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SizedBox(
          width: 36,
          height: 36,
          child: state.hadCart(data)
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: MyColors.colorPrimary,
                      primary: MyColors.colorPrimary,
                      onPrimary: MyColors.colorWhite,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      shape: const CircleBorder()),
                  onPressed: () => DashboardCoordinator.showYourCart(context),
                  child: const Image(image: AssetImage(MyIcons.bagWhiteIcon)))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: MyColors.colorWhite,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: MyColors.colorWhite,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      onPrimary: MyColors.colorPrimary,
                      shape: const CircleBorder()),
                  onPressed: () => context.read<CartBloc>().addToCart(context,
                      product: data, sizeType: data.size ?? 'N/A'),
                  child: const Image(
                    image: AssetImage(MyIcons.activeBagIcon),
                    height: 20,
                    fit: BoxFit.fill,
                  )),
        );
      },
    );
  }
}
