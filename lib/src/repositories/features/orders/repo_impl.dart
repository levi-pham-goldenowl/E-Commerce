import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/repositories/features/orders/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/order_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<XResult<XOrder>> addOrder(XOrder order) async {
    try {
      final User? user = AuthService().currentUser;
      var data = OrderCollectionReference(id: user?.uid ?? 'N/A')
          .addYourOrder(data: order);
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<List<XOrder>>> getYourOrder() async {
    try {
      final User? user = AuthService().currentUser;
      var data = OrderCollectionReference(id: user?.uid ?? 'N/A').getAllOrder();
      return data;
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
