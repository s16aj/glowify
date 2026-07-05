import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a new user using email and password.
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign in using email and password.
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign in using a Google account.
  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '716525555959-lde5eptn4be3ohchqgng8qt5u14no10u.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // User closed the Google Sign-In window.
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  // Sign out from both Google and Firebase.
  Future<void> logout() async {
    await GoogleSignIn(
      clientId:
          '716525555959-lde5eptn4be3ohchqgng8qt5u14no10u.apps.googleusercontent.com',
    ).signOut();
    await _auth.signOut();
  }

  // Listen for authentication state changes.
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}
