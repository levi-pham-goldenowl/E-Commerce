// ignore_for_file: no_duplicate_case_values

import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/features/sign/repo.dart';
import 'package:e_commerce/src/repositories/firestore/collection_ref.dart/users_collection_reference.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

enum AccountType { google, emailAndPassword }

class SignRepositoryImpl implements SignRepository {
  @override
  Future<XResult<XUser>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await AuthService()
          .signInWithEmailAndPassword(email: email, password: password);
      var data = UserCollectionReference().getUserOrAddNew(user.user!);
      return data;
    } on FirebaseAuthException catch (error) {
      String message = handleError(codeError: error.code);

      return XResult.error(message);
    }
  }

  @override
  Future<XResult<XUser>> loginWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
            await AuthService().userCredentialWeb(authProvider);

        var data = UserCollectionReference().getUserOrAddNew(
          userCredential.user!,
        );
        return data;
      } on FirebaseAuthException catch (error) {
        String message = handleError(codeError: error.code);
        return XResult.error(message);
      }
    } else {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        var userCredential = await AuthService().userCredential(credential);
        var data = UserCollectionReference().getUserOrAddNew(
          userCredential.user!,
        );

        return data;
      } on FirebaseAuthException catch (error) {
        String message = handleError(codeError: error.code);
        return XResult.error(message);
      }
    }
  }

  @override
  Future<XResult<XUser>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await AuthService()
          .createUserWithEmailAndPassword(email: email, password: password);
      var data = XUser(
          email: email,
          name: name,
          id: user.user?.uid ?? "",
          accountType: AccountType.emailAndPassword.name);
      UserCollectionReference().set(data);

      return XResult.success(data);
    } on FirebaseAuthException catch (error) {
      String message = handleError(codeError: error.code);

      return XResult.error(message);
    }
  }

  @override
  Future<XResult> logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await AuthService().signOut();
      await googleSignIn.signOut();
      return XResult.success("success");
    } catch (e) {
      return XResult.exception(e);
    }
  }

  String handleError({required String codeError}) {
    switch (codeError) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      default:
        return "Login failed. Please try again.";
    }
  }
}
