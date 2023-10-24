import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/dashboard/logic/bottom_bar_bloc.dart';
import 'package:e_commerce/src/modules/delivery/logic/delivery_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/paginate_favorites_bloc.dart';

import 'package:e_commerce/src/modules/order/logic/order_bloc.dart';

import 'package:e_commerce/src/modules/notification/logic/notification_bloc.dart';
import 'package:e_commerce/src/modules/notification/pages/notification_page.dart';

import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/modules/promotion/logic/promotion_bloc.dart';
import 'package:e_commerce/src/modules/shop/logic/categories_bloc.dart';
import 'package:e_commerce/src/modules/view_all_products/logic/view_all_products_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DashboardWrapperPage extends StatefulWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  State<DashboardWrapperPage> createState() => _DashboardWrapperPageState();
}

class _DashboardWrapperPageState extends State<DashboardWrapperPage> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        context.router.pushWidget(const NotificationPage());
      }
    });
    FirebaseMessaging.instance.getToken().then((value) {
      log('Token device firebase : ${value ?? 'N.A'}');
    });

    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async =>
            context.router.pushWidget(const NotificationPage()));
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null) {
        if (android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  icon: android.smallIcon,
                ),
              ));
        } else {
          XSnackBar.show(
              msg: 'title: ${notification.title}'
                  '\n'
                  'body: ${notification.body}');
        }
        context.read<NotificationBloc>().addNotification(XMessage(
            id: XUtils.getRandomString(10),
            body: notification.body ?? 'N/A',
            image: notification.android?.imageUrl,
            dateTime:
                XUtils.dateTimeNotification(message.sentTime ?? DateTime.now()),
            title: notification.title ?? 'N/A'));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
        (message) => context.router.pushWidget(const NotificationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BottomBarBloc()),
          BlocProvider(create: (_) => CartBloc()),
          BlocProvider(create: (_) => FavoriteBloc()),
          BlocProvider(
            create: (context) => PaginateFavoritesBloc(),
          ),
          BlocProvider(
              create: (_) => ListProductsFilterBloc(ListProductsFilterState(
                  searchList: XHandle.completed([]),
                  items: XHandle.completed([])))),
          BlocProvider(create: (_) => CategoriesBloc()),
          BlocProvider(create: (_) => PromotionBloc()),
          BlocProvider(create: (_) => DeliveryBloc()),
          BlocProvider(create: (_) => ViewAllProductsBloc()),
          BlocProvider(create: (_) => OrderBloc()),
        ],
        child: WillPopScope(
            onWillPop: () async => false,
            child: const Scaffold(body: AutoRouter())));
  }
}
