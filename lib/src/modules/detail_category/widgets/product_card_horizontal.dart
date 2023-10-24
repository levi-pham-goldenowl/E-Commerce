import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product/widgets/display_label.dart';
import 'package:e_commerce/src/modules/product/widgets/price_product_widget.dart';
import 'package:e_commerce/src/modules/product/widgets/review_star.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:flutter/material.dart';

class XProductCardHorizontal extends StatelessWidget {
  final XProduct data;
  const XProductCardHorizontal({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DashboardCoordinator.showDetailsProduct(context,
          data: data, id: data.id),
      child: SizedBox(
        height: 114,
        width: 343,
        child: Stack(
          children: [
            _belowCard(),
            SizedBox(
              height: 114,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: XDisplayLabel(data: data)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: XButtonAddToFavorite(
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
    const radius = Radius.circular(8);
    return Container(
      height: 104,
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
              borderRadius:
                  const BorderRadius.only(topLeft: radius, bottomLeft: radius),
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
                data.type,
                style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.colorBlack,
                    height: 1,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                data.name,
                style: const TextStyle(
                    fontSize: 11,
                    color: MyColors.colorGray,
                    fontWeight: FontWeight.normal),
              ),
              XReviewStar(numberStar: data.star),
              XPriceProductWidget(data: data)
            ],
          ),
        ],
      ),
    );
  }
}
