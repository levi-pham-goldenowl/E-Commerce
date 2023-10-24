import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/paginate_view_all_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaginateViewAllBloc(),
        child: const Scaffold(body: AutoRouter()));
  }
}
