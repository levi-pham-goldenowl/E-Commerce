import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteCollectionReference extends BaseCollectionReference<XProduct> {
  FavoriteCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Favorite')
            .withConverter<XProduct>(
              fromFirestore: (snapshot, _) => XProduct.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));

  Future<XResult<XProduct>> addProductToFavorite(XProduct product) async {
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
          favorite: true,
        );
        ref.doc(idDocs).set(value);

        return XResult.success(product);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XProduct>> deleteProductToFavorite(XProduct product) async {
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

  Future<XResult<List<XProduct>>> getProductToFavorite() async {
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

  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductToFavorite(
      DocumentSnapshot? lastDoc) async {
    try {
      final User? user = AuthService().currentUser;
      final QuerySnapshot<XProduct> query;
      if (user != null) {
        query = lastDoc != null
            ? await ref
                .where('idUser', isEqualTo: user.uid)
                .startAfterDocument(lastDoc)
                .get()
            : await ref.where('idUser', isEqualTo: user.uid).limit(6).get();

        List<DocumentSnapshot<XProduct>> docs = query.docs;
        return XResult.success(docs);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
