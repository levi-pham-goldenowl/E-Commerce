import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/features/shipping_address/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShippingAddressRepositoryImpl implements ShippingAddressRepository {
  @override
  Future<XResult<XUser>> setDefaultShippingAddress(
      XShippingAddress data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      List<XShippingAddress> shippingAddresses = (user.shippingAddresses ?? []);

      for (int i = 0; i < shippingAddresses.length; i++) {
        shippingAddresses[i].setDefault = false;
      }
      shippingAddresses[shippingAddresses.indexWhere((e) => e.id == data.id)] =
          data;

      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          urlAvatar: user.urlAvatar,
          paymentMethods: user.paymentMethods,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: shippingAddresses);

      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XUser>> addShippingAddress(XShippingAddress data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      List<XShippingAddress> shippingAddresses = (user.shippingAddresses ?? []);
      shippingAddresses.add(data);
      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          paymentMethods: user.paymentMethods,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: shippingAddresses);
      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult<XUser>> updateShippingAddress(XShippingAddress data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      List<XShippingAddress> shippingAddresses = (user.shippingAddresses ?? []);
      shippingAddresses[shippingAddresses.indexWhere((e) => e.id == data.id)] =
          data;

      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          paymentMethods: user.paymentMethods,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: shippingAddresses);

      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }

  @override
  Future<XResult> removeShippingAddress(XShippingAddress data) async {
    User? currentUser = AuthService().currentUser;

    try {
      var value =
          await UserCollectionReference().get(currentUser?.uid ?? "N/A");
      var user = value.data ?? XUser();
      List<XShippingAddress> shippingAddresses = (user.shippingAddresses ?? []);

      shippingAddresses.removeWhere(
        (e) => e.id == data.id,
      );
      var dataUser = XUser(
          email: user.email,
          name: user.name,
          id: user.id,
          paymentMethods: user.paymentMethods,
          urlAvatar: user.urlAvatar,
          birthDay: user.birthDay,
          accountType: user.accountType,
          shippingAddresses: shippingAddresses);

      UserCollectionReference().set(dataUser);
      return XResult.success(dataUser);
    } catch (e) {
      return XResult.error(e.toString());
    }
  }
}
