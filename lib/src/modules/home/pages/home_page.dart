import 'package:e_commerce/src/modules/home/router/home_router.dart';
import 'package:e_commerce/src/modules/home/widgets/banner.dart';
import 'package:e_commerce/src/modules/home/widgets/slider_product.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          stretch: true,
          expandedHeight: size.height * 0.24,
          flexibleSpace: const FlexibleSpaceBar(
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
            background: BannerHome(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 18, top: 37),
              child: Column(
                children: ProductType.values
                    .map((e) => SliderProduct(
                        onPressedViewAll: () => HomeCoordinator.showViewAll(
                            context,
                            productType: e),
                        productType: e))
                    .toList(),
              ),
            );
          }, childCount: 1),
        ),
      ],
    ));
  }
}
