import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/features/promotions/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/promotions_collection_reference.dart';

class PromotionRepositoryImpl implements PromotionRepository {
  @override
  Future<XResult<List<XPromotion>>> addPromotions() async {
    var data = PromotionsCollectionReference().addPromotions();
    return data;
  }

  @override
  Future<XResult<List<XPromotion>>> getPromotions() async {
    var data = await PromotionsCollectionReference().getPromotions();
    return data;
  }
}
