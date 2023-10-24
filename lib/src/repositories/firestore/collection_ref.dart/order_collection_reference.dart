import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/order_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderCollectionReference extends BaseCollectionReference<XOrder> {
  final String id;
  OrderCollectionReference({required this.id})
      : super(FirebaseFirestore.instance
            .collection('User/$id/Orders')
            .withConverter<XOrder>(
              fromFirestore: (snapshot, _) => XOrder.formDocument(snapshot),
              toFirestore: (order, _) => order.toJson(),
            ));

  Future<XResult<List<XOrder>>> getAllOrder() async {
    try {
      return query();
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<XOrder>> addYourOrder({required XOrder data}) async {
    try {
      final User? user = AuthService().currentUser;
      if (user != null) {
        ref.add(data);

        return XResult.success(data);
      } else {
        return XResult.error('Not login yet');
      }
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
