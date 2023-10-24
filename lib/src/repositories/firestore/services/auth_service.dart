import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  static AuthService? instance;
  factory AuthService() {
    return instance ?? AuthService._();
  }
  AuthService._();

  Future<UserCredential> userCredential(AuthCredential credential) async =>
      await auth.signInWithCredential(credential);
  Future<UserCredential> userCredentialWeb(GoogleAuthProvider provider) async =>
      await auth.signInWithPopup(provider);

  Future<UserCredential> signInWithEmailAndPassword(
          {String email = "", String password = ""}) async =>
      await auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> createUserWithEmailAndPassword(
          {String email = "", String password = ""}) async =>
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<void> signOut() async => await auth.signOut();
}
