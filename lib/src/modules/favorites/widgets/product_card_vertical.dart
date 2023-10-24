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

class XProductCardFavoriteVertical extends StatelessWidget {
  final XProduct data;
  const XProductCardFavoriteVertical({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.soldOut
        ? _soldOutWidget()
        : GestureDetector(
            onTap: () => DashboardCoordinator.showDetailsProduct(context,
                data: data, id: data.id),
            child: SizedBox(
              height: 280,
              width: 164,
              child: Stack(
                children: [
                  _belowCard(),
                  SizedBox(
                    height: 200,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          width: 162,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(data.image ?? "N/A"),
            ),
          ),
        ),
        XReviewStar(numberStar: data.star),
        Text(
          data.name,
          style: const TextStyle(
              fontSize: 11,
              color: MyColors.colorGray,
              fontWeight: FontWeight.normal),
        ),
        Text(
          data.type,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 16,
              overflow: TextOverflow.clip,
              color: MyColors.colorBlack,
              height: 1,
              fontWeight: FontWeight.w600),
        ),
        XDisplaySizeAndColor(data: data),
        XPriceProductWidget(data: data)
      ],
    );
  }

  Widget _soldOutWidget() {
    return SizedBox(
      height: 280,
      width: 164,
      child: Stack(
        children: [
          _belowCard(),
          Container(
            color: MyColors.colorWhite.withOpacity(0.5),
            height: 280,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: 184,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 36,
                color: MyColors.colorWhite.withOpacity(0.7),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child: Text(
                    "Sorry, this item is currently sold out",
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        fontSize: 11,
                        height: 1.42,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
