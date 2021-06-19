import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class AuthServices {
  final FirebaseAuth _auth;
  AuthServices(this._auth);
  Stream<User> get authStateChanges => _auth.authStateChanges();
  Future<String> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> signUp({String name, String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User user = _auth.currentUser;
      final uid = user.uid;
      await DatabaseServices(uid: user.uid).updateUserData(
        name,
        email,
      );
      return 'SignedUp';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
