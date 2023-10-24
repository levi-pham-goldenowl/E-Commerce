import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class PromotionRepository {
  Future<XResult<List<XPromotion>>> getPromotions();
  Future<XResult<List<XPromotion>>> addPromotions();
}
