import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/product/widgets/display_label.dart';
import 'package:e_commerce/src/modules/product/widgets/price_product_widget.dart';
import 'package:e_commerce/src/modules/product/widgets/review_star.dart';
import 'package:e_commerce/src/utils/enum/page_info.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet_select_size.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XDetails extends StatelessWidget {
  final XProduct data;
  const XDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String contentText =
        'Short dress in soft cotton jersey with decorative buttons down the front'
        ' and a wide, frill-trimmed square neckline with concealed elastication.'
        'Elasticated seam under the bust and short puff sleeves with a small frill trim.';
    const sizeBox = SizedBox(
      height: 15,
    );
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                      fontSize: 24,
                      height: 1.42,
                      color: MyColors.colorBlack,
                      fontWeight: FontWeight.w600),
                ),
                XPriceProductWidget(
                  data: data,
                  fontSize: 24,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.type,
                        style: const TextStyle(
                            color: MyColors.colorGray,
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            height: 1)),
                    XReviewStar(numberStar: data.star)
                  ],
                ),
                XDisplayLabel(data: data)
              ],
            ),
            sizeBox,
            const Text(
              contentText,
              style: TextStyle(
                  height: 1.42,
                  fontSize: 14,
                  color: MyColors.colorBlack,
                  fontWeight: FontWeight.normal),
            ),
            sizeBox,
            state.hadCart(data)
                ? const XButton(
                    label: 'PRODUCT IN CART',
                    height: 48,
                    width: double.infinity,
                  )
                : XButton(
                    label: 'ADD TO CART',
                    height: 48,
                    onPressed: () {
                      context.read<CartBloc>().initSizeType();

                      XBottomSheet.show(context,
                          widget: XBottomSheetSelectSize(
                            pageInfo: PageInfo.cart,
                            data: data,
                          ));
                    },
                    width: double.infinity,
                  )
          ],
        ),
      );
    });
  }
}
