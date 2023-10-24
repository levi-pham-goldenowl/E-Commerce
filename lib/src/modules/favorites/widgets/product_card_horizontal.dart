import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/widgets/display_label.dart';
import 'package:e_commerce/src/modules/product/widgets/display_size_and_color.dart';
import 'package:e_commerce/src/modules/product/widgets/price_product_widget.dart';
import 'package:e_commerce/src/modules/product/widgets/review_star.dart';
import 'package:e_commerce/src/widgets/button/button_add_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XProductCardFavoriteHorizontal extends StatelessWidget {
  final XProduct data;
  const XProductCardFavoriteHorizontal({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.soldOut
        ? _soldOutWidget()
        : GestureDetector(
            onTap: () => DashboardCoordinator.showDetailsProduct(context,
                data: data, id: data.id),
            child: SizedBox(
              height: 104,
              width: 343,
              child: Stack(
                children: [
                  _belowCard(),
                  SizedBox(
                    height: 104,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              XDisplayLabel(data: data),
                              BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: (context, state) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: const Icon(Icons.clear,
                                          color: MyColors.colorGray),
                                      onTap: () => context
                                          .read<FavoriteBloc>()
                                          .removeProductToFavorite(context,
                                              product: data),
                                    )),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: XButtonAddToCart(
                              data: data,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          );
  }

  Widget _belowCard() {
    return Container(
      height: 94,
      decoration: BoxDecoration(
          color: MyColors.colorWhite,
          boxShadow: const [
            BoxShadow(
                blurRadius: 25,
                offset: Offset(0, 1),
                color: MyColors.colorWhite,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 104,
            width: 104,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(data.image ?? "N/A"),
              ),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 11,
                    color: MyColors.colorGray,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                data.type,
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              XDisplaySizeAndColor(data: data),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 60, child: XPriceProductWidget(data: data)),
                  const SizedBox(
                    width: 30,
                  ),
                  XReviewStar(numberStar: data.star),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _soldOutWidget() {
    return SizedBox(
      height: 114,
      width: 343,
      child: Stack(
        children: [
          _belowCard(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: MyColors.colorWhite.withOpacity(0.5),
                height: 94,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          XDisplayLabel(data: data),
                          BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: const Icon(Icons.clear,
                                      color: MyColors.colorGray),
                                  onTap: () => context
                                      .read<FavoriteBloc>()
                                      .removeProductToFavorite(context,
                                          product: data),
                                )),
                          )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "Sorry, this item is currently sold out",
                style: TextStyle(
                    color: MyColors.colorGray,
                    fontSize: 11,
                    height: 1,
                    fontWeight: FontWeight.normal),
              )
            ],
          )
        ],
      ),
    );
  }
}
