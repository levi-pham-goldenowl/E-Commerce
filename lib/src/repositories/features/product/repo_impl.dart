import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/repositories/features/product/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/products_collection_reference.dart';
import 'package:e_commerce/src/utils/enum/product_type.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<XResult<List<XProduct>>> getProduct() async {
    try {
      var data = await ProductCollectionReference().getProduct();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsFilter(
      {required ProductType productType, DocumentSnapshot? lastDoc}) async {
    try {
      var data = await ProductCollectionReference()
          .getNextProductsFilter(productType: productType, lastDoc: lastDoc);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<DocumentSnapshot<XProduct>>>> getNextProductsSearch(
      {String? name, DocumentSnapshot? lastDoc}) async {
    try {
      var data = await ProductCollectionReference()
          .getNextProductsSearch(name: name, lastDoc: lastDoc);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XProduct>>> addProduct() async {
    try {
      var data = ProductCollectionReference().updateProduct();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
