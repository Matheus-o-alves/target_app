import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:target_app/data/models/user_model.dart';
import 'package:target_app/domain/usecases/auth_usecase.dart';

class AuthRepository implements AuthUseCase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      return user != null
          ? AppUser(
              uid: user.uid,
              email: user.email ?? '',
            )
          : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AppUser?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return user != null
          ? AppUser(
              uid: user.uid,
              email: user.email ?? '',
            )
          : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint("$e");
    }
  }
}
