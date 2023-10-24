import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/cart/logic/cart_bloc.dart';
import 'package:e_commerce/src/modules/favorites/logic/paginate_favorites_bloc.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/utils/enum/color_type.dart';
import 'package:e_commerce/src/utils/enum/size_type.dart';
import 'package:e_commerce/src/utils/enum/sort_by.dart';
import 'package:e_commerce/src/utils/enum/view_type.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoriteBloc extends ListProductsFilterBloc<FavoriteState> {
  FavoriteBloc()
      : super(FavoriteState(
            listFavorite: XHandle.initial(),
            items: XHandle.initial(),
            searchList: XHandle.completed([]))) {
    getProduct();
  }

  @override
  Future<void> getProduct() async {
    User? currentUser = AuthService().currentUser;
    final value = await domain.favorite.getProductToFavorite();
    if (value.isSuccess) {
      List<XProduct> items = [...(state.listFavorite.data ?? [])];
      items = (value.data ?? [])
          .where((e) => e.idUser == currentUser?.uid)
          .toList();
      emit(state.copyWithItem(listFavorite: XHandle.completed(items)));
    } else {}
  }

  Future<void> addProductToFavorite(BuildContext context,
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
        amount: product.amount,
        favorite: true);
    final value = await domain.favorite.addProductToFavorite(xProduct);
    if (value.isSuccess) {
      final List<XProduct> items = [
        ...(state.listFavorite.data ?? []),
        xProduct
      ];
      setItemToCart(
        context,
        product: xProduct,
        favorite: true,
      );

      emit(state.copyWithItem(listFavorite: XHandle.completed(items)));
      context.read<PaginateFavoritesBloc>().fetchFirstData();

      XSnackBar.show(msg: 'Favorite success');
      XCoordinator.pop(context);
    } else {
      XSnackBar.show(msg: 'Favorite failure');
    }
  }

  Future<void> setItemToCart(
    BuildContext context, {
    required XProduct product,
    required bool favorite,
  }) async {
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
        amount: product.amount,
        favorite: favorite);

    if (product.amount > 0) {
      final value = await domain.cart.increaseProduct(xProduct);
      if (value.isSuccess) {
        context.read<CartBloc>().getProduct();
      }
    }
  }

  Future<void> removeProductToFavorite(BuildContext context,
      {required XProduct product}) async {
    final value = await domain.favorite.deleteProductToFavorite(product);
    if (value.isSuccess) {
      final List<XProduct> items = [...(state.listFavorite.data ?? [])];
      items.remove(product);
      setItemToCart(
        context,
        product: product,
        favorite: false,
      );

      emit(state.copyWithItem(listFavorite: XHandle.completed(items)));
      context.read<PaginateFavoritesBloc>().fetchFirstData();
      getProduct();

      XSnackBar.show(msg: 'Remove Product success');
    } else {
      XSnackBar.show(msg: 'Remove Product failure');
    }
  }

  @override
  Future<void> searchProduct(String query) async {
    late List<XProduct> items;
    if (query.isEmpty || query == '') {
      items = [];
    } else {
      items = (state.listFavorite.data ?? []).where((e) {
        final titleLower = e.name.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    }

    emit(state.copyWithItem(
        searchList: XHandle.completed(items), searchText: query));
  }
}
