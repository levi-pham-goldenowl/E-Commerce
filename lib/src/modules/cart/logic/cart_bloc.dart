import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/router/cart_router.dart';
import 'package:e_commerce/src/modules/favorites/logic/favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartBloc extends ListProductsFilterBloc<CartState> {
  CartBloc()
      : super(CartState(
            productsOfCart: XHandle.completed([]),
            items: XHandle.completed([]),
            searchList: XHandle.completed([]))) {
    getProduct();
  }

  @override
  Future<void> getProduct() async {
    User? currentUser = AuthService().currentUser;
    final value = await domain.cart.getProductsOfCart();
    if (value.isSuccess) {
      List<XProduct> items = [...(state.productsOfCart.data ?? [])];
      items = (value.data ?? [])
          .where((e) => e.idUser == currentUser?.uid)
          .toList();
      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));
    }
  }

  Future<void> setItemToFavorites(BuildContext context,
      {required XProduct product, required int amount}) async {
    XProduct xProduct = XProduct(
      color: product.color,
      currentPrice: product.currentPrice,
      discount: product.discount,
      id: product.id,
      idCategory: product.idCategory,
      idUser: product.idUser,
      image: product.image,
      name: product.name,
      nameCategory: product.nameCategory,
      newProduct: product.newProduct,
      originalPrice: product.originalPrice,
      size: product.size,
      star: product.star,
      type: product.type,
      soldOut: product.soldOut,
      amount: amount,
      favorite: product.favorite,
    );
    if (product.favorite) {
      final value = await domain.favorite.addProductToFavorite(xProduct);
      if (value.isSuccess) {
        context.read<FavoriteBloc>().getProduct();
      }
    }
  }

  Future<void> addToCart(BuildContext context,
      {required XProduct product, required String sizeType}) async {
    XProduct xProduct = XProduct(
      color: product.color,
      currentPrice: product.currentPrice,
      discount: product.discount,
      id: product.id,
      idCategory: product.idCategory,
      idUser: product.idUser,
      image: product.image,
      name: product.name,
      nameCategory: product.nameCategory,
      newProduct: product.newProduct,
      originalPrice: product.originalPrice,
      size: sizeType,
      star: product.star,
      type: product.type,
      soldOut: product.soldOut,
      amount: 1,
      favorite: product.favorite,
    );
    final value = await domain.cart.addToCard(xProduct);

    if (value.isSuccess) {
      final List<XProduct> items = [
        ...(state.productsOfCart.data ?? []),
        xProduct
      ];

      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));
      setItemToFavorites(context, product: xProduct, amount: xProduct.amount);
      XSnackBar.show(msg: 'Add to cart success');
      XCoordinator.pop(context);
    } else {
      XSnackBar.show(msg: 'Add to cart failure');
    }
  }

  Future<void> removeProductToCart(BuildContext context,
      {required XProduct product}) async {
    final value = await domain.cart.deleteToCart(product);
    if (value.isSuccess) {
      final List<XProduct> items = [...(state.productsOfCart.data ?? [])];
      items.remove(product);

      emit(state.copyWithItem(productsOfCart: XHandle.completed(items)));

      setItemToFavorites(context, product: product, amount: 0);

      XSnackBar.show(msg: 'Remove product to cart success');
    } else {
      XSnackBar.show(msg: 'Remove product to cart failure');
    }
  }

  Future<void> removeYourCard(BuildContext context,
      {required List<XProduct> listProducts}) async {
    final value = await domain.cart.removeYourCart(listProducts);
    if (value.isSuccess) {
      emit(state.copyWithItem(productsOfCart: XHandle.completed([])));
      for (int i = 0; i < listProducts.length; i++) {
        setItemToFavorites(context, product: listProducts[i], amount: 0);
      }
    }
  }

  @override
  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.productsOfCart.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query));
  }

  Future<void> increaseProduct(BuildContext context,
      {required XProduct product}) async {
    XProduct xProduct = XProduct(
      color: product.color,
      currentPrice: product.currentPrice,
      discount: product.discount,
      id: product.id,
      idCategory: product.idCategory,
      idUser: product.idUser,
      image: product.image,
      name: product.name,
      nameCategory: product.nameCategory,
      newProduct: product.newProduct,
      originalPrice: product.originalPrice,
      size: product.size,
      star: product.star,
      type: product.type,
      soldOut: product.soldOut,
      amount: product.amount + 1,
      favorite: product.favorite,
    );
    final value = await domain.cart.increaseProduct(xProduct);
    if (value.isSuccess) {
      getProduct();
      setItemToFavorites(context, product: xProduct, amount: xProduct.amount);
    } else {
      XSnackBar.show(msg: 'Error');
    }
  }

  Future<void> decreaseProduct(BuildContext context,
      {required XProduct product}) async {
    XProduct xProduct = XProduct(
      color: product.color,
      currentPrice: product.currentPrice,
      discount: product.discount,
      id: product.id,
      idCategory: product.idCategory,
      idUser: product.idUser,
      image: product.image,
      name: product.name,
      nameCategory: product.nameCategory,
      newProduct: product.newProduct,
      originalPrice: product.originalPrice,
      size: product.size,
      star: product.star,
      type: product.type,
      soldOut: product.soldOut,
      favorite: product.favorite,
      amount: product.amount - 1,
    );
    final value = await domain.cart.decreaseProduct(xProduct);
    if (value.isSuccess) {
      if (product.amount == 1) {
        removeProductToCart(context, product: product);
      }
      getProduct();
      setItemToFavorites(context,
          product: xProduct, amount: product.amount - 1);
    } else {
      XSnackBar.show(msg: 'Error');
    }
  }
}
