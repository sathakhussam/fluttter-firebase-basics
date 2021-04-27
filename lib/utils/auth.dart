import 'package:eb_bill/models/custom_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  createCustomUserFromFirebaseUser(user) {
    return user != null ? CustomUser(user.uid, user.email) : null;
  }

  signUpAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;

      return createCustomUserFromFirebaseUser(user);
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    try {
      final result = await _auth.signOut();
      return null;
    } catch (e) {
      print(e);
    }
  }

  signUpWithEmailAndPassword(email, password) async {
    try {
      final results = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user_data = results.user;
      final user = createCustomUserFromFirebaseUser(user_data);
      user.saveToFirestore(user);
      return user;
    } catch (e) {}
  }

  signInWithEmailAndPassword(email, password) async {
    try {
      final results = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = results.user;
      return createCustomUserFromFirebaseUser(user);
    } catch (e) {}
  }

  Stream<User> get userChanges => _auth.authStateChanges();
}
