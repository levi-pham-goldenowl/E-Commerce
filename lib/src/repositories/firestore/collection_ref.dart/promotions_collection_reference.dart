import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class PromotionsCollectionReference
    extends BaseCollectionReference<XPromotion> {
  PromotionsCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Promotions')
            .withConverter<XPromotion>(
              fromFirestore: (snapshot, _) => XPromotion.formDocument(snapshot),
              toFirestore: (promotion, _) => promotion.toJson(),
            ));

  Future<XResult<List<XPromotion>>> getPromotions() async {
    return query();
  }

  Future<XResult<List<XPromotion>>> addPromotions() async {
    return commit(listPromotions);
  }
}
