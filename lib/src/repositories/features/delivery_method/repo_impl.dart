import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/features/delivery_method/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/delivery_collection_reference.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  @override
  Future<XResult<List<XDeliveryMethod>>> addDelivery() async {
    var data = DeliveryCollectionReference().addDeliveryMethod();
    return data;
  }

  @override
  Future<XResult<List<XDeliveryMethod>>> getAllDeliveryMethod() async {
    var data = await DeliveryCollectionReference().getAllDeliveryMethod();
    return data;
  }
}
