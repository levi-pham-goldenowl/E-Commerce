import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/notification/pages/notification_page.dart';
import 'package:e_commerce/src/modules/order/router/order_router.dart';
import 'package:e_commerce/src/modules/profile/pages/profile_page.dart';
import 'package:e_commerce/src/modules/promotion/pages/promotion_page.dart';
import 'package:e_commerce/src/modules/settings/pages/setting_page.dart';
import 'package:flutter/material.dart';

class ProfileRouters {
  static const String setting = 'setting';
  static const String notification = 'notification';
  static const String promotion = 'promotion';
}

class ProfileCoordinator {
  static const autoRoute = AutoRoute(
      name: "ProfileTab",
      page: EmptyRouterPage,
      path: DashboardTaps.profileTab,
      children: [
        AutoRoute(path: "", page: ProfilePage, name: "ProfileRoute"),
        AutoRoute(
            path: ProfileRouters.setting,
            page: SettingPage,
            name: "SettingRoute"),
        AutoRoute(
            path: ProfileRouters.notification,
            page: NotificationPage,
            name: "NotificationRoute"),
        OrderCoordinator.autoRoute,
        AutoRoute(
            path: ProfileRouters.promotion,
            page: PromotionPage,
            name: "PromotionRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showSetting(BuildContext context) =>
      context.router.push(const SettingRoute());
  static showNotification(BuildContext context) =>
      context.router.push(const NotificationRoute());
  static showPromotion(BuildContext context) =>
      context.router.push(const PromotionRoute());
}
