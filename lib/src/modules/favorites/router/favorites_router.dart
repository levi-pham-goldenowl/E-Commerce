import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/config/routes/auto_router.gr.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/favorites/pages/favorites_page.dart';
import 'package:e_commerce/src/modules/favorites/pages/search_favorite_page.dart';
import 'package:flutter/material.dart';

class FavoritesRouters {
  static const String searchProductsByFavorite = 'search_products_by_favorite';
}

class FavoritesCoordinator {
  static const autoRoute = AutoRoute(
      path: DashboardTaps.favoritesTab,
      page: EmptyRouterPage,
      name: 'FavoritesTab',
      children: [
        AutoRoute(path: "", page: FavoritesPage, name: "FavoritesRoute"),
        AutoRoute(
            path: FavoritesRouters.searchProductsByFavorite,
            page: SearchFavoritePage,
            name: "SearchFavoriteRoute"),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static showSearchProductByFavorite(
    BuildContext context,
  ) =>
      context.router.push(const SearchFavoriteRoute());
}
