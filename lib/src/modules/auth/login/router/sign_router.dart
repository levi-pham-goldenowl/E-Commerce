import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/auth/login/pages/login_page.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_wrapper_router.dart';
import 'package:e_commerce/src/modules/auth/sign_up/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';

class SignRouters {
  static const String login = 'login';
  static const String signUp = 'register';
}

class SignCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.sign,
    name: "SignRouter",
    page: SignWrapperPage,
    children: [
      AutoRoute(path: SignRouters.login, page: LoginPage),
      AutoRoute(path: SignRouters.signUp, page: SignUpPage, initial: true),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static showLogin(BuildContext context) {
    context.router.pushNamed(SignRouters.login);
  }

  static showSignUp(BuildContext context) {
    context.router.replace(const SignRouter());
  }
}
