import 'package:ecommerce_app/core/errors/firebase_exp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> deleteUser() async {
    try {
      await _auth.currentUser!.delete();
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }
}
