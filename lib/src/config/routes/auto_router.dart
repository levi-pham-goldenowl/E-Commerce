import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/page_routers.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/loading/pages/loading_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    DashboardCoordinator.autoRoute,
    SignCoordinator.autoRoute,
    AutoRoute(
      path: XRoutes.loading,
      page: LoadingPage,
      initial: true,
    ),
    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
