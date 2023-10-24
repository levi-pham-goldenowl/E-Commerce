import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  static pop(BuildContext context) => context.router.pop();

  static showDashboard() => rootRouter.replace(const DashboardWrapperRoute());
}
