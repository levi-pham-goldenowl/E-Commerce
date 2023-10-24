import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ReviewRepository {
  Future<XResult<List<XReview>>> getAllReview({required XProduct product});
  Future<XResult<List<XReview>>> setReviews({required XProduct product});
  Future<XResult<XReview>> addYourReview(
      {required XProduct product, required XReview review});
  Future<XResult<List<String>>> uploadImageReview({required List<XFile> list});
}
