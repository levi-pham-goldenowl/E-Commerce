import 'dart:async';

import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountBloc<T extends AccountState> extends Cubit<T> {
  AccountBloc(T initialState) : super(initialState) {
    getUser();
  }

  final Domain domain = Domain();

  StreamController<XUser?> streamUser = StreamController.broadcast();

  Future<void> getUser() async {
    await Future.delayed(Duration.zero);
    User? currentUser = AuthService().currentUser;

    if (currentUser == null) {
      emit(state.copyWith(isLoading: false, data: XUser.empty()) as T);
    } else {
      var result = await UserCollectionReference().getUserOrAddNew(currentUser);
      var data = result.data ?? XUser.empty();

      emit(state.copyWith(data: data, isLoading: false) as T);
    }
  }

  void setDataLogin(BuildContext context, {XUser? user}) {
    streamUser.add(user);

    emit(state.copyWith(data: user, isLoading: false) as T);
  }

  Future<void> logout(BuildContext context) async {
    await Future.delayed(Duration.zero);

    emit(state.copyWith(isLoading: true, data: XUser.empty()) as T);
    domain.sign.logout();
    SignCoordinator.showSignUp(context);
  }
}
