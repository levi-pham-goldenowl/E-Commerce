import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/models/result.dart';

abstract class DeliveryRepository {
  Future<XResult<List<XDeliveryMethod>>> getAllDeliveryMethod();
  Future<XResult<List<XDeliveryMethod>>> addDelivery();
}
