import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class CategoryRepository {
  Future<XResult<List<XCategories>>> fetchCategory();

  Future<XResult<List<XCategories>>> addCategory();
}
