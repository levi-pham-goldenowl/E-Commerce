import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartCollectionReference extends BaseCollectionReference<XProduct> {
  CartCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Cart')
            .withConverter<XProduct>(
              fromFirestore: (snapshot, _) => XProduct.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));

  Future<XResult<XProduct>> addToCart(XProduct product) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        String idDocs = product.id + user.uid;

        XProduct value = XProduct(
            color: product.color,
            currentPrice: product.currentPrice,
            discount: product.discount,
            id: product.id,
            idCategory: product.idCategory,
            idUser: user.uid,
            image: product.image,
            name: product.name,
            nameCategory: product.nameCategory,
            newProduct: product.newProduct,
            originalPrice: product.originalPrice,
            size: product.size,
            star: product.star,
            type: product.type,
            soldOut: product.soldOut,
            amount: 1,
            favorite: product.favorite);
        ref.doc(idDocs).set(value);

        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XProduct>> deleteProductToCart(XProduct product) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        String idDocs = product.id + user.uid;
        remove(idDocs);
        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XProduct>>> deleteYourCart(
      List<XProduct> listProducts) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        for (int i = 0; i < listProducts.length; i++) {
          String idDocs = listProducts[i].id + user.uid;
          remove(idDocs);
        }

        return XResult.success(listProducts);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XProduct>>> getProductOfCart() async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        return query();
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XProduct>> increaseProduct(XProduct product) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        String idDocs = product.id + user.uid;

        XProduct value = XProduct(
            color: product.color,
            currentPrice: product.currentPrice,
            discount: product.discount,
            id: product.id,
            idCategory: product.idCategory,
            idUser: user.uid,
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
            favorite: product.favorite);
        ref.doc(idDocs).set(value);

        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XProduct>> decreaseProduct(XProduct product) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        String idDocs = product.id + user.uid;

        XProduct value = XProduct(
            color: product.color,
            currentPrice: product.currentPrice,
            discount: product.discount,
            id: product.id,
            idCategory: product.idCategory,
            idUser: user.uid,
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
            favorite: product.favorite);
        ref.doc(idDocs).set(value);

        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
