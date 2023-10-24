// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i35;

import '../../models/order_model.dart' as _i37;
import '../../models/products_model.dart' as _i36;
import '../../models/shipping_address_model.dart' as _i38;
import '../../modules/auth/login/pages/login_page.dart' as _i33;
import '../../modules/auth/login/router/sign_wrapper_router.dart' as _i2;
import '../../modules/auth/sign_up/pages/sign_up_page.dart' as _i34;
import '../../modules/cart/pages/cart_page.dart' as _i17;
import '../../modules/checkout/pages/checkout_page.dart' as _i18;
import '../../modules/dashboard/pages/dashboard_page.dart' as _i4;
import '../../modules/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../../modules/detail_category/pages/detail_category_page.dart' as _i15;
import '../../modules/detail_category/pages/search_products_page.dart' as _i16;
import '../../modules/details_order/pages/details_order_page.dart' as _i27;
import '../../modules/favorites/pages/favorites_page.dart' as _i19;
import '../../modules/favorites/pages/search_favorite_page.dart' as _i20;
import '../../modules/home/pages/home_page.dart' as _i12;
import '../../modules/home/router/home_wrapper_router.dart' as _i9;
import '../../modules/loading/pages/loading_page.dart' as _i3;
import '../../modules/notification/pages/notification_page.dart' as _i23;
import '../../modules/order/page/my_order_page.dart' as _i26;
import '../../modules/order/router/order_wrapper_router.dart' as _i24;
import '../../modules/payment_method/pages/payment_method_page.dart' as _i6;
import '../../modules/product_details/pages/product_details_page.dart' as _i28;
import '../../modules/product_details/router/product_details_wrapper_router.dart'
    as _i5;
import '../../modules/profile/pages/profile_page.dart' as _i21;
import '../../modules/promotion/pages/promotion_page.dart' as _i25;
import '../../modules/review/pages/review_page.dart' as _i29;
import '../../modules/settings/pages/setting_page.dart' as _i22;
import '../../modules/shipping_address/adding_shipping_address/pages/adding_shipping_address_page.dart'
    as _i31;
import '../../modules/shipping_address/edit_shipping_address/edit_shipping_address_page.dart'
    as _i32;
import '../../modules/shipping_address/router/shipping_address_wrapper_router.dart'
    as _i7;
import '../../modules/shipping_address/shipping_addresses/pages/shipping_addresses_page.dart'
    as _i30;
import '../../modules/shop/pages/shop_page.dart' as _i14;
import '../../modules/shop/router/shop_wrapper_router.dart' as _i10;
import '../../modules/success/pages/success_page.dart' as _i8;
import '../../modules/view_all_products/pages/view_all_products_page.dart'
    as _i13;

class XRouter extends _i11.RootStackRouter {
  XRouter([_i35.GlobalKey<_i35.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperPage());
    },
    SignRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignWrapperPage());
    },
    LoadingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoadingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    ProductDetailsWrapperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsWrapperRouteArgs>(
          orElse: () =>
              ProductDetailsWrapperRouteArgs(id: pathParams.getString('id')));
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ProductDetailsWrapperPage(
              id: args.id, data: args.data, key: args.key));
    },
    PaymentMethodRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PaymentMethodPage());
    },
    ShippingAddressesWrapperRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ShippingAddressWrapperPage());
    },
    SuccessRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SuccessPage());
    },
    HomeTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeWrapperPage());
    },
    ShopTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ShopWrapperPage());
    },
    CartTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    FavoritesTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomePage());
    },
    ViewAllRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ViewAllProductsPage());
    },
    ShopRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ShopPage());
    },
    DetailCategoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.DetailCategoryPage());
    },
    SearchProductsByCategoryRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i16.SearchProductsByCategoryPage());
    },
    CartRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.CartPage());
    },
    CheckoutRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.CheckoutPage());
    },
    FavoritesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.FavoritesPage());
    },
    SearchFavoriteRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.SearchFavoritePage());
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.ProfilePage());
    },
    SettingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.SettingPage());
    },
    NotificationRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.NotificationPage());
    },
    OrderWrapperRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.OrderWrapperPage());
    },
    PromotionRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.PromotionPage());
    },
    MyOrderRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.MyOrderPage());
    },
    DetailsOrderRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsOrderRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i27.DetailsOrderPage(key: args.key, data: args.data));
    },
    ProductDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.ProductDetailsPage());
    },
    ReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i29.ReviewPage(key: args.key, data: args.data));
    },
    ShippingAddressesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.ShippingAddressesPage());
    },
    AddShippingAddressRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.AddShippingAddressPage());
    },
    EditShippingAddressRoute.name: (routeData) {
      final args = routeData.argsAs<EditShippingAddressRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i32.EditShippingAddressPage(key: args.key, data: args.data));
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i33.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.SignUpPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig('/#redirect',
            path: '/', redirectTo: '', fullMatch: true),
        _i11.RouteConfig(DashboardWrapperRoute.name,
            path: '/dashboard',
            children: [
              _i11.RouteConfig(DashboardRoute.name,
                  path: '',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i11.RouteConfig(HomeTab.name,
                        path: 'home',
                        parent: DashboardRoute.name,
                        children: [
                          _i11.RouteConfig(HomeRoute.name,
                              path: '', parent: HomeTab.name),
                          _i11.RouteConfig(ViewAllRoute.name,
                              path: 'view_all', parent: HomeTab.name),
                          _i11.RouteConfig('*#redirect',
                              path: '*',
                              parent: HomeTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i11.RouteConfig(ShopTab.name,
                        path: 'shop',
                        parent: DashboardRoute.name,
                        children: [
                          _i11.RouteConfig(ShopRoute.name,
                              path: '', parent: ShopTab.name),
                          _i11.RouteConfig(DetailCategoryRoute.name,
                              path: 'product_by_category',
                              parent: ShopTab.name),
                          _i11.RouteConfig(SearchProductsByCategoryRoute.name,
                              path: 'search_products_by_category',
                              parent: ShopTab.name),
                          _i11.RouteConfig('*#redirect',
                              path: '*',
                              parent: ShopTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i11.RouteConfig(CartTab.name,
                        path: 'cart',
                        parent: DashboardRoute.name,
                        children: [
                          _i11.RouteConfig(CartRoute.name,
                              path: '', parent: CartTab.name),
                          _i11.RouteConfig(CheckoutRoute.name,
                              path: 'checkout', parent: CartTab.name),
                          _i11.RouteConfig('*#redirect',
                              path: '*',
                              parent: CartTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i11.RouteConfig(FavoritesTab.name,
                        path: 'favorites',
                        parent: DashboardRoute.name,
                        children: [
                          _i11.RouteConfig(FavoritesRoute.name,
                              path: '', parent: FavoritesTab.name),
                          _i11.RouteConfig(SearchFavoriteRoute.name,
                              path: 'search_products_by_favorite',
                              parent: FavoritesTab.name),
                          _i11.RouteConfig('*#redirect',
                              path: '*',
                              parent: FavoritesTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i11.RouteConfig(ProfileTab.name,
                        path: 'profile',
                        parent: DashboardRoute.name,
                        children: [
                          _i11.RouteConfig(ProfileRoute.name,
                              path: '', parent: ProfileTab.name),
                          _i11.RouteConfig(SettingRoute.name,
                              path: 'setting', parent: ProfileTab.name),
                          _i11.RouteConfig(NotificationRoute.name,
                              path: 'notification', parent: ProfileTab.name),
                          _i11.RouteConfig(OrderWrapperRoute.name,
                              path: 'my_order',
                              parent: ProfileTab.name,
                              children: [
                                _i11.RouteConfig(MyOrderRoute.name,
                                    path: '', parent: OrderWrapperRoute.name),
                                _i11.RouteConfig(DetailsOrderRoute.name,
                                    path: 'detail_order',
                                    parent: OrderWrapperRoute.name),
                                _i11.RouteConfig('*#redirect',
                                    path: '*',
                                    parent: OrderWrapperRoute.name,
                                    redirectTo: '',
                                    fullMatch: true)
                              ]),
                          _i11.RouteConfig(PromotionRoute.name,
                              path: 'promotion', parent: ProfileTab.name),
                          _i11.RouteConfig('*#redirect',
                              path: '*',
                              parent: ProfileTab.name,
                              redirectTo: '',
                              fullMatch: true)
                        ]),
                    _i11.RouteConfig('*#redirect',
                        path: '*',
                        parent: DashboardRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i11.RouteConfig(ProductDetailsWrapperRoute.name,
                  path: 'product/:id',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i11.RouteConfig(ProductDetailsRoute.name,
                        path: '', parent: ProductDetailsWrapperRoute.name),
                    _i11.RouteConfig(ReviewRoute.name,
                        path: 'review',
                        parent: ProductDetailsWrapperRoute.name),
                    _i11.RouteConfig('*#redirect',
                        path: '*',
                        parent: ProductDetailsWrapperRoute.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i11.RouteConfig(PaymentMethodRoute.name,
                  path: 'payment_method', parent: DashboardWrapperRoute.name),
              _i11.RouteConfig(ShippingAddressesWrapperRoute.name,
                  path: 'shipping_address',
                  parent: DashboardWrapperRoute.name,
                  children: [
                    _i11.RouteConfig(ShippingAddressesRoute.name,
                        path: '', parent: ShippingAddressesWrapperRoute.name),
                    _i11.RouteConfig(AddShippingAddressRoute.name,
                        path: 'add_shipping_address',
                        parent: ShippingAddressesWrapperRoute.name),
                    _i11.RouteConfig(EditShippingAddressRoute.name,
                        path: 'edit_shipping_address',
                        parent: ShippingAddressesWrapperRoute.name)
                  ]),
              _i11.RouteConfig(SuccessRoute.name,
                  path: 'success', parent: DashboardWrapperRoute.name),
              _i11.RouteConfig('*#redirect',
                  path: '*',
                  parent: DashboardWrapperRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i11.RouteConfig(SignRouter.name, path: '/sign', children: [
          _i11.RouteConfig('#redirect',
              path: '',
              parent: SignRouter.name,
              redirectTo: 'register',
              fullMatch: true),
          _i11.RouteConfig(LoginRoute.name,
              path: 'login', parent: SignRouter.name),
          _i11.RouteConfig(SignUpRoute.name,
              path: 'register', parent: SignRouter.name),
          _i11.RouteConfig('*#redirect',
              path: '*',
              parent: SignRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i11.RouteConfig(LoadingRoute.name, path: ''),
        _i11.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i11.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(DashboardWrapperRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRouter extends _i11.PageRouteInfo<void> {
  const SignRouter({List<_i11.PageRouteInfo>? children})
      : super(SignRouter.name, path: '/sign', initialChildren: children);

  static const String name = 'SignRouter';
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i11.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(DashboardRoute.name, path: '', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.ProductDetailsWrapperPage]
class ProductDetailsWrapperRoute
    extends _i11.PageRouteInfo<ProductDetailsWrapperRouteArgs> {
  ProductDetailsWrapperRoute(
      {required String id,
      _i36.XProduct? data,
      _i35.Key? key,
      List<_i11.PageRouteInfo>? children})
      : super(ProductDetailsWrapperRoute.name,
            path: 'product/:id',
            args: ProductDetailsWrapperRouteArgs(id: id, data: data, key: key),
            rawPathParams: {'id': id},
            initialChildren: children);

  static const String name = 'ProductDetailsWrapperRoute';
}

class ProductDetailsWrapperRouteArgs {
  const ProductDetailsWrapperRouteArgs({required this.id, this.data, this.key});

  final String id;

  final _i36.XProduct? data;

  final _i35.Key? key;

  @override
  String toString() {
    return 'ProductDetailsWrapperRouteArgs{id: $id, data: $data, key: $key}';
  }
}

/// generated route for
/// [_i6.PaymentMethodPage]
class PaymentMethodRoute extends _i11.PageRouteInfo<void> {
  const PaymentMethodRoute()
      : super(PaymentMethodRoute.name, path: 'payment_method');

  static const String name = 'PaymentMethodRoute';
}

/// generated route for
/// [_i7.ShippingAddressWrapperPage]
class ShippingAddressesWrapperRoute extends _i11.PageRouteInfo<void> {
  const ShippingAddressesWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(ShippingAddressesWrapperRoute.name,
            path: 'shipping_address', initialChildren: children);

  static const String name = 'ShippingAddressesWrapperRoute';
}

/// generated route for
/// [_i8.SuccessPage]
class SuccessRoute extends _i11.PageRouteInfo<void> {
  const SuccessRoute() : super(SuccessRoute.name, path: 'success');

  static const String name = 'SuccessRoute';
}

/// generated route for
/// [_i9.HomeWrapperPage]
class HomeTab extends _i11.PageRouteInfo<void> {
  const HomeTab({List<_i11.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i10.ShopWrapperPage]
class ShopTab extends _i11.PageRouteInfo<void> {
  const ShopTab({List<_i11.PageRouteInfo>? children})
      : super(ShopTab.name, path: 'shop', initialChildren: children);

  static const String name = 'ShopTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class CartTab extends _i11.PageRouteInfo<void> {
  const CartTab({List<_i11.PageRouteInfo>? children})
      : super(CartTab.name, path: 'cart', initialChildren: children);

  static const String name = 'CartTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class FavoritesTab extends _i11.PageRouteInfo<void> {
  const FavoritesTab({List<_i11.PageRouteInfo>? children})
      : super(FavoritesTab.name, path: 'favorites', initialChildren: children);

  static const String name = 'FavoritesTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class ProfileTab extends _i11.PageRouteInfo<void> {
  const ProfileTab({List<_i11.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i13.ViewAllProductsPage]
class ViewAllRoute extends _i11.PageRouteInfo<void> {
  const ViewAllRoute() : super(ViewAllRoute.name, path: 'view_all');

  static const String name = 'ViewAllRoute';
}

/// generated route for
/// [_i14.ShopPage]
class ShopRoute extends _i11.PageRouteInfo<void> {
  const ShopRoute() : super(ShopRoute.name, path: '');

  static const String name = 'ShopRoute';
}

/// generated route for
/// [_i15.DetailCategoryPage]
class DetailCategoryRoute extends _i11.PageRouteInfo<void> {
  const DetailCategoryRoute()
      : super(DetailCategoryRoute.name, path: 'product_by_category');

  static const String name = 'DetailCategoryRoute';
}

/// generated route for
/// [_i16.SearchProductsByCategoryPage]
class SearchProductsByCategoryRoute extends _i11.PageRouteInfo<void> {
  const SearchProductsByCategoryRoute()
      : super(SearchProductsByCategoryRoute.name,
            path: 'search_products_by_category');

  static const String name = 'SearchProductsByCategoryRoute';
}

/// generated route for
/// [_i17.CartPage]
class CartRoute extends _i11.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i18.CheckoutPage]
class CheckoutRoute extends _i11.PageRouteInfo<void> {
  const CheckoutRoute() : super(CheckoutRoute.name, path: 'checkout');

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i19.FavoritesPage]
class FavoritesRoute extends _i11.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: '');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i20.SearchFavoritePage]
class SearchFavoriteRoute extends _i11.PageRouteInfo<void> {
  const SearchFavoriteRoute()
      : super(SearchFavoriteRoute.name, path: 'search_products_by_favorite');

  static const String name = 'SearchFavoriteRoute';
}

/// generated route for
/// [_i21.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i22.SettingPage]
class SettingRoute extends _i11.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i23.NotificationPage]
class NotificationRoute extends _i11.PageRouteInfo<void> {
  const NotificationRoute()
      : super(NotificationRoute.name, path: 'notification');

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i24.OrderWrapperPage]
class OrderWrapperRoute extends _i11.PageRouteInfo<void> {
  const OrderWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(OrderWrapperRoute.name,
            path: 'my_order', initialChildren: children);

  static const String name = 'OrderWrapperRoute';
}

/// generated route for
/// [_i25.PromotionPage]
class PromotionRoute extends _i11.PageRouteInfo<void> {
  const PromotionRoute() : super(PromotionRoute.name, path: 'promotion');

  static const String name = 'PromotionRoute';
}

/// generated route for
/// [_i26.MyOrderPage]
class MyOrderRoute extends _i11.PageRouteInfo<void> {
  const MyOrderRoute() : super(MyOrderRoute.name, path: '');

  static const String name = 'MyOrderRoute';
}

/// generated route for
/// [_i27.DetailsOrderPage]
class DetailsOrderRoute extends _i11.PageRouteInfo<DetailsOrderRouteArgs> {
  DetailsOrderRoute({_i35.Key? key, required _i37.XOrder data})
      : super(DetailsOrderRoute.name,
            path: 'detail_order',
            args: DetailsOrderRouteArgs(key: key, data: data));

  static const String name = 'DetailsOrderRoute';
}

class DetailsOrderRouteArgs {
  const DetailsOrderRouteArgs({this.key, required this.data});

  final _i35.Key? key;

  final _i37.XOrder data;

  @override
  String toString() {
    return 'DetailsOrderRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i28.ProductDetailsPage]
class ProductDetailsRoute extends _i11.PageRouteInfo<void> {
  const ProductDetailsRoute() : super(ProductDetailsRoute.name, path: '');

  static const String name = 'ProductDetailsRoute';
}

/// generated route for
/// [_i29.ReviewPage]
class ReviewRoute extends _i11.PageRouteInfo<ReviewRouteArgs> {
  ReviewRoute({_i35.Key? key, required _i36.XProduct data})
      : super(ReviewRoute.name,
            path: 'review', args: ReviewRouteArgs(key: key, data: data));

  static const String name = 'ReviewRoute';
}

class ReviewRouteArgs {
  const ReviewRouteArgs({this.key, required this.data});

  final _i35.Key? key;

  final _i36.XProduct data;

  @override
  String toString() {
    return 'ReviewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i30.ShippingAddressesPage]
class ShippingAddressesRoute extends _i11.PageRouteInfo<void> {
  const ShippingAddressesRoute() : super(ShippingAddressesRoute.name, path: '');

  static const String name = 'ShippingAddressesRoute';
}

/// generated route for
/// [_i31.AddShippingAddressPage]
class AddShippingAddressRoute extends _i11.PageRouteInfo<void> {
  const AddShippingAddressRoute()
      : super(AddShippingAddressRoute.name, path: 'add_shipping_address');

  static const String name = 'AddShippingAddressRoute';
}

/// generated route for
/// [_i32.EditShippingAddressPage]
class EditShippingAddressRoute
    extends _i11.PageRouteInfo<EditShippingAddressRouteArgs> {
  EditShippingAddressRoute({_i35.Key? key, required _i38.XShippingAddress data})
      : super(EditShippingAddressRoute.name,
            path: 'edit_shipping_address',
            args: EditShippingAddressRouteArgs(key: key, data: data));

  static const String name = 'EditShippingAddressRoute';
}

class EditShippingAddressRouteArgs {
  const EditShippingAddressRouteArgs({this.key, required this.data});

  final _i35.Key? key;

  final _i38.XShippingAddress data;

  @override
  String toString() {
    return 'EditShippingAddressRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i33.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i34.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'register');

  static const String name = 'SignUpRoute';
}
