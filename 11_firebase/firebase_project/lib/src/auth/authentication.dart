// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void signIn() {
  if (kIsWeb) {
    signInWithGoogleWeb();
  } else {
    signInWithGoogle();
  }
}

Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential?> signInWithGoogleWeb() async {
  final GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}
