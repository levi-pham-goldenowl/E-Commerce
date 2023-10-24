import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product_details/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/product_details/widgets/details.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_color.dart';
import 'package:e_commerce/src/modules/product_details/widgets/dropdown_size.dart';
import 'package:e_commerce/src/modules/product_details/widgets/list_tile.dart';
import 'package:e_commerce/src/modules/product_details/widgets/related_products.dart';
import 'package:e_commerce/src/modules/product_details/widgets/top_images.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_add_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        var value = state.product;
        return Scaffold(
          backgroundColor: MyColors.colorBackground,
          appBar: XDefaultAppBar(
            title: value.type,
            leading: BackButton(onPressed: () => XCoordinator.pop(context)),
            style: const TextStyle(
                color: MyColors.colorBlack,
                fontSize: 18,
                height: 1.42,
                fontWeight: FontWeight.w600),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share))
            ],
          ),
          body: ListView(
            children: [
              TopImages(urlImage: value.image ?? 'N/A'),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: Column(
                    children: [
                      _topButton(value),
                      const SizedBox(height: 20),
                      XDetails(data: value)
                    ],
                  )),
              ListTileDetailProduct(data: value),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 30),
                child: RelatedProducts(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _topButton(XProduct product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XDropdownSize(data: product),
        const XDropdownColor(),
        XButtonAddToFavorite(data: product),
      ],
    );
  }
}
