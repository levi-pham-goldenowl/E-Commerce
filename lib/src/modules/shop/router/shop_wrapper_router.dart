import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/detail_category/logic/paginate_detail_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopWrapperPage extends StatelessWidget {
  const ShopWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaginateDetailCategoryBloc(),
        child: const Scaffold(body: AutoRouter()));
  }
}
