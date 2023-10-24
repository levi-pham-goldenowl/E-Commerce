import 'package:e_commerce/src/repositories/features/account/repo.dart';
import 'package:e_commerce/src/repositories/features/account/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/cart/repo.dart';
import 'package:e_commerce/src/repositories/features/cart/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/delivery_method/repo.dart';
import 'package:e_commerce/src/repositories/features/delivery_method/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/favorite/repo.dart';
import 'package:e_commerce/src/repositories/features/favorite/repo_impl.dart';

import 'package:e_commerce/src/repositories/features/orders/repo.dart';
import 'package:e_commerce/src/repositories/features/orders/repo_impl.dart';

import 'package:e_commerce/src/repositories/features/payment_method/repo.dart';
import 'package:e_commerce/src/repositories/features/payment_method/repo_impl.dart';

import 'package:e_commerce/src/repositories/features/notification/repo.dart';
import 'package:e_commerce/src/repositories/features/notification/repo_impl.dart';

import 'package:e_commerce/src/repositories/features/profile/repo.dart';
import 'package:e_commerce/src/repositories/features/profile/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/categories/repo.dart';
import 'package:e_commerce/src/repositories/features/categories/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/product/repo.dart';
import 'package:e_commerce/src/repositories/features/product/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/promotions/repo.dart';
import 'package:e_commerce/src/repositories/features/promotions/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/review/repo.dart';
import 'package:e_commerce/src/repositories/features/review/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/shipping_address/repo.dart';
import 'package:e_commerce/src/repositories/features/shipping_address/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/sign/repo.dart';
import 'package:e_commerce/src/repositories/features/sign/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    account = AccountRepositoryImpl();
    sign = SignRepositoryImpl();
    profile = ProfileRepositoryImpl();
    product = ProductRepositoryImpl();
    category = CategoryRepositoryImpl();
    favorite = FavoriteRepositoryImpl();
    cart = CartRepositoryImpl();
    promotion = PromotionRepositoryImpl();
    review = ReviewRepositoryImpl();
    paymentMethod = PaymentMethodRepositoryImpl();
    address = ShippingAddressRepositoryImpl();
    order = OrderRepositoryImpl();
    notification = NotificationRepositoryImpl();
    delivery = DeliveryRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final AccountRepository account;
  late final SignRepository sign;
  late final ProfileRepository profile;
  late final ProductRepository product;
  late final CategoryRepository category;
  late final FavoriteRepository favorite;
  late final CartRepository cart;
  late final PromotionRepository promotion;
  late final ReviewRepository review;
  late final PaymentMethodRepository paymentMethod;
  late final ShippingAddressRepository address;
  late final OrderRepository order;
  late final NotificationRepository notification;
  late final DeliveryRepository delivery;
}
