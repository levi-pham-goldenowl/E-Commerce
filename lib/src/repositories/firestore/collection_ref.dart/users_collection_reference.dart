import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/base_collection_reference.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCollectionReference extends BaseCollectionReference<XUser> {
  UserCollectionReference()
      : super(
            FirebaseFirestore.instance.collection('User').withConverter<XUser>(
                  fromFirestore: (snapshot, _) => XUser.formDocument(snapshot),
                  toFirestore: (userModel, _) => userModel.toJson(),
                ));

  Future<XResult<XUser>> getUserOrAddNew(User user) async {
    try {
      late final XUser data;

      var result = await get(user.uid);
      if (result.data == null) {
        data = XUser.fromFirebaseUser(user);
        set(data);
      } else {
        var name = result.data?.name;
        var url = result.data?.urlAvatar;
        var birthDay = result.data?.birthDay;
        var type = result.data?.accountType ?? 'N/A';
        var paymentMethods = result.data?.paymentMethods;
        var shippingAddresses = result.data?.shippingAddresses;

        data = XUser(
            email: user.email ?? 'N/A',
            shippingAddresses: shippingAddresses,
            name: name ?? (user.displayName ?? 'N/A'),
            birthDay: birthDay,
            id: user.uid,
            accountType: type,
            urlAvatar: url,
            paymentMethods: paymentMethods);
      }
      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
