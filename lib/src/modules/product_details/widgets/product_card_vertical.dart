import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product/widgets/display_label.dart';
import 'package:e_commerce/src/modules/product/widgets/price_product_widget.dart';
import 'package:e_commerce/src/modules/product/widgets/review_star.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:flutter/material.dart';

class XProductCardVertical extends StatelessWidget {
  final XProduct data;
  final Function()? onTap;
  const XProductCardVertical({Key? key, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () => DashboardCoordinator.showDetailsProduct(context,
              data: data, id: data.id),
      child: SizedBox(
        height: 260,
        width: 164,
        child: Stack(
          children: [
            _belowCard(),
            SizedBox(
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: XDisplayLabel(
                          data: data,
                        )),
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
        XPriceProductWidget(data: data)
      ],
    );
  }
}
