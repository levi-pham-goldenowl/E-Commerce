import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/features/payment_method/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  @override
  Future<XResult<XUser>> addPaymentMethod(XPaymentMethod data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      final paymentMethods = (user.paymentMethods ?? []);
      paymentMethods.add(data);
      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: user.shippingAddresses,
          paymentMethods: paymentMethods);
      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XUser>> updatePaymentMethod(XPaymentMethod data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      final paymentMethods = (user.paymentMethods ?? []);
      for (int i = 0; i < paymentMethods.length; i++) {
        paymentMethods[i].setDefault = false;
      }
      paymentMethods[paymentMethods.indexWhere((e) => e.id == data.id)] = data;

      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: user.shippingAddresses,
          paymentMethods: paymentMethods);

      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult> removePaymentMethod(XPaymentMethod data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      final paymentMethods = (user.paymentMethods ?? []);

      paymentMethods.removeWhere(
        (e) => e.id == data.id,
      );
      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: user.shippingAddresses,
          paymentMethods: paymentMethods);

      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
