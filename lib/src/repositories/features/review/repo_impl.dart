import 'dart:io';

import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/repositories/features/review/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/review_collection_reference.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ReviewRepositoryImpl implements ReviewRepository {
  @override
  Future<XResult<List<XReview>>> getAllReview(
      {required XProduct product}) async {
    try {
      var data = await ReviewCollectionReference(id: product.id).getAllReview();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XReview>>> setReviews({required XProduct product}) async {
    try {
      var data = ReviewCollectionReference(id: product.id).setReviews();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XReview>> addYourReview(
      {required XProduct product, required XReview review}) async {
    try {
      var data = ReviewCollectionReference(id: product.id)
          .addYourReview(review: review);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<String>>> uploadImageReview(
      {required List<XFile> list}) async {
    List<String> listUrlImage = [];
    try {
      for (var image in list) {
        final File imageFile = File(image.path);
        var result = await firebase_storage.FirebaseStorage.instance
            .ref('products/reviews/${image.name}')
            .putFile(imageFile);
        listUrlImage.add((await result.ref.getDownloadURL()).toString());
      }

      return XResult.success(listUrlImage);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
