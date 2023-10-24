import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/repositories/features/categories/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/categories_collection_reference.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<XResult<List<XCategories>>> fetchCategory() async {
    try {
      var data = CategoriesCollectionReference().getCategories();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XCategories>>> addCategory() async {
    try {
      var data = CategoriesCollectionReference().updateCategories();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
