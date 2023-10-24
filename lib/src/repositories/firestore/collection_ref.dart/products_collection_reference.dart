import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';
import 'package:e_commerce/src/utils/enum/extension.dart';

class ProductCollectionReference extends BaseCollectionReference<XProduct> {
  ProductCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Product')
            .withConverter<XProduct>(
              fromFirestore: (snapshot, _) => XProduct.formDocument(snapshot),
              toFirestore: (userModel, _) => userModel.toJson(),
            ));

  Future<XResult<List<XProduct>>> getProduct() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsFilter(
      {required ProductType productType, DocumentSnapshot? lastDoc}) async {
    try {
      final QuerySnapshot<XProduct> query;
      query = lastDoc != null
          ? await ref
              .where(productType.field(),
                  isNotEqualTo: productType == ProductType.sale ? 0 : null,
                  isEqualTo: productType.isEqualTo())
              .startAfterDocument(lastDoc)
              .limit(6)
              .get()
          : await ref
              .where(productType.field(),
                  isNotEqualTo: productType == ProductType.sale ? 0 : null,
                  isEqualTo: productType == ProductType.sale
                      ? null
                      : productType.isEqualTo())
              .limit(6)
              .get();

      List<DocumentSnapshot<XProduct>> docs = query.docs;
      return XResult.success(docs);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XProduct>>> updateProduct() async {
    return commit(listProduct);
  }

  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsSearch(
      {String? name, DocumentSnapshot? lastDoc}) async {
    var value = (name ?? '').toTitleCase();
    try {
      if (name != '' && name != null) {
        final QuerySnapshot<XProduct> query;
        query = lastDoc != null
            ? await ref
                .where('name', isGreaterThanOrEqualTo: value)
                .where('name', isLessThan: value + '\uf8ff')
                .startAfterDocument(lastDoc)
                .limit(8)
                .get()
            : await ref
                .where('name', isGreaterThanOrEqualTo: value)
                .where('name', isLessThan: value + '\uf8ff')
                .limit(8)
                .get();

        List<DocumentSnapshot<XProduct>> docs = query.docs;
        return XResult.success(docs);
      } else {
        return XResult.error('Error');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
