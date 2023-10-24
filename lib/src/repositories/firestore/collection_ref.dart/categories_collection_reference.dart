import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class CategoriesCollectionReference
    extends BaseCollectionReference<XCategories> {
  CategoriesCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Categories')
            .withConverter<XCategories>(
              fromFirestore: (snapshot, _) =>
                  XCategories.formDocument(snapshot),
              toFirestore: (category, _) => category.toJson(),
            ));
  Future<XResult<List<XCategories>>> getCategories() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<XCategories>>> updateCategories() async {
    return commit(listCategories);
  }
}
