import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/shop/router/shop_router.dart';
import 'package:e_commerce/src/modules/shop/widgets/category_list_tile.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 16,
    );
    return Scaffold(
      appBar: XDefaultAppBar(
        elevation: 3,
        title: "Categories",
        style: const TextStyle(
            color: MyColors.colorBlack,
            fontSize: 18,
            height: 1.42,
            fontWeight: FontWeight.w600),
        backgroundColor: MyColors.colorBackground,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: MyColors.colorBlack,
            onPressed: () =>
                ShopCoordinator.showSearchProductByCategory(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: XButton(
                        label: 'VIEW ALL ITEMS',
                        onPressed: () {},
                      ),
                    ),
                    sizedBox,
                    const Text(
                      "Choose category",
                      style: TextStyle(
                          color: MyColors.colorGray,
                          fontSize: 14,
                          height: 1.42,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              sizedBox,
              const CategoryListTile()
            ],
          ),
        ),
      ),
    );
  }
}
