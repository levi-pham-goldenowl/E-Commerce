import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/product_details/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/review/logic/write_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsWrapperPage extends StatelessWidget {
  final XProduct? data;
  final String id;
  const ProductDetailsWrapperPage({
    @PathParam('id') required this.id,
    this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = data ?? XProduct();

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ProductBloc(ProductState(product: value)),
      ),
      BlocProvider(
          create: (_) => ReviewBloc(
                product: value,
              )),
      BlocProvider(create: (_) => WriteReviewBloc()),
    ], child: const Scaffold(body: AutoRouter()));
  }
}
