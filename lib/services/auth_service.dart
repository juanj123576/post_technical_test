import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:my_app/models/user.dart';

class AuthService {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  User? _userfirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return firebaseAuth.authStateChanges().map(_userfirebase);
  }

  Future<User?> signInWithEmailAndPassword(email, password) async {
    final credentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userfirebase(credentials.user);
  }

  Future<User?> createUserWithEmailAndPassword(email, password) async {
    final credentials = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userfirebase(credentials.user);
  }

  Future<void> singOut() async {
    return await firebaseAuth.signOut();
  }
}
