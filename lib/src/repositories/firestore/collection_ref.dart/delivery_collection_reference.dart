import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/_dev/data_firebase.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';

class DeliveryCollectionReference
    extends BaseCollectionReference<XDeliveryMethod> {
  DeliveryCollectionReference()
      : super(FirebaseFirestore.instance
            .collection('Deliverys')
            .withConverter<XDeliveryMethod>(
              fromFirestore: (snapshot, _) =>
                  XDeliveryMethod.formDocument(snapshot),
              toFirestore: (delivery, _) => delivery.toJson(),
            ));

  Future<XResult<List<XDeliveryMethod>>> getAllDeliveryMethod() async {
    return query();
  }

  Future<XResult<List<XDeliveryMethod>>> addDeliveryMethod() async {
    return commit(listDeliveryMethod);
  }
}
