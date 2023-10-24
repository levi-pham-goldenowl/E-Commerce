import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';

abstract class ProductRepository {
  Future<XResult<List<XProduct>>> getProduct();

  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsFilter(
      {required ProductType productType, DocumentSnapshot? lastDoc});

  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsSearch(
      {String? name, DocumentSnapshot? lastDoc});

  Future<XResult<List<XProduct>>> addProduct();
}
