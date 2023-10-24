import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/themes/themes.dart';
import 'package:e_commerce/src/models/message_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/notification/logic/notification_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/modules/shipping_address/logic/shipping_address_bloc.dart';

import 'package:e_commerce/src/repositories/firestore/services/dynamic_link_service.dart';
import 'package:e_commerce/src/utils/helpers/environment.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'src/config/routes/auto_router.gr.dart';
import 'src/localization/localization_util.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  if (notification != null) {
    NotificationBloc().addNotification(XMessage(
        id: XUtils.getRandomString(10),
        body: notification.body ?? 'N/A',
        image: notification.android?.imageUrl,
        dateTime:
            XUtils.dateTimeNotification(message.sentTime ?? DateTime.now()),
        title: notification.title ?? 'N/A'));
    NotificationBloc().getAllNotification();
  }
}

late AndroidNotificationChannel channel;

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await dotenv.load(fileName: Environment.fileName);

  await Firebase.initializeApp(
    name: kIsWeb ? null : 'E-conmmerce',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerLazySingleton(() => XRouter());

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    //  blocObserver: XBlocObserver()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    super.initState();
    FirebaseDynamicLinkService.initDynamicLink(context);
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AccountBloc(AccountState(data: XUser.empty()))),
        BlocProvider(create: (_) => PaymentMethodBloc()),
        BlocProvider(create: (_) => ShippingAddressBloc()),
        BlocProvider(
          create: (context) => NotificationBloc(),
        )
      ],
      child: MaterialApp.router(
        theme: XTheme.light(),
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        darkTheme: XTheme.dark(),
        themeMode: ThemeMode.light,
        restorationScopeId: 'app',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        routeInformationParser: appRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
      ),
    );
  }
}
