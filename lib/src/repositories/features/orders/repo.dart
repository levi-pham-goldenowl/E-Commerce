import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class OrderRepository {
  Future<XResult<XOrder>> addOrder(XOrder order);
  Future<XResult<List<XOrder>>> getYourOrder();
}
