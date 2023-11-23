import 'package:target_app/data/models/user_model.dart';

abstract class AuthUseCase {
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);
  Future<AppUser?> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
