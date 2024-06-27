import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();

  // Getter for the current user
  User? get user => _user.value;

  // Stream to listen for user changes
  Stream<User?> get userStream => _auth.userChanges();

  // Check if the user's email is verified
  bool get isEmailVerified => user?.emailVerified ?? false;

  @override
  Future<void> onInit() async {
    _user.value = _auth.currentUser;
    _auth.userChanges().listen((User? user) {
      _user.value = user;
    });
    super.onInit();
  }

  // Register a new user with email and password
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((credential) {
        credential.user?.sendEmailVerification();
        credential.user?.updateDisplayName(fullName);
      });
    } catch (e) {
      rethrow;
    }
  }

  // Login an existing user with email and password
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!isEmailVerified) {
        Get.snackbar('Verification Required', 'Please verify your email.');
        await logout();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw const NoGoogleAccountChosenException();
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Reset password
  Future<void> resetPassword({required String email}) =>
      _auth.sendPasswordResetEmail(email: email);

  // Logout the current user
  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    await Get.offAllNamed('/login');
  }
}

// Custom exception for when no Google account is chosen
class NoGoogleAccountChosenException implements Exception {
  const NoGoogleAccountChosenException();
}
