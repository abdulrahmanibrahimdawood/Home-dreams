import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignInAccount, GoogleSignIn, GoogleSignInAuthentication;
import 'package:home_dreams/core/errors/exceptions.dart';
import 'package:home_dreams/generated/l10n.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.CreateUserWithEmailAndPassword: ${e.message} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: S.current.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: S.current.emailAlreadyInUse);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.noInternet);
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: S.current.invalidEmailFormat);
      } else {
        throw CustomException(message: S.current.genericAuthErrorAlt);
      }
    } catch (e) {
      throw CustomException(message: S.current.genericAuthErrorAlt);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: S.current.wrongCredentials);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: S.current.wrongCredentials);
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: S.current.wrongCredentials);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.current.noInternet);
      } else {
        throw CustomException(message: S.current.genericAuthErrorAlt);
      }
    } catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
    }
    throw CustomException(message: S.current.genericAuthErrorAlt);
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult = await FacebookAuth.instance.login(
      nonce: nonce,
    );
    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw CustomException(message: S.current.genericAuthErrorAlt);
    }
  }

  Future<void> updateDisplayName({required String name}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(name);
      await user?.reload();
    } on FirebaseAuthException {
      throw CustomException(message: S.current.nameUpdateError);
    }
  }

  Future<void> updatePassword({required String newPassword}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw CustomException(message: S.current.notSignedIn);
    }
    try {
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        message: e.message ?? S.current.passwordUpdateError,
      );
    }
  }

  Future<void> reauthenticate({
    required String email,
    required String password,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw CustomException(message: S.current.notSignedIn);
    }
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    try {
      await user.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        message: e.message ?? S.current.wrongCurrentPassword,
      );
    }
  }

  Future<void> updateEmail({required String newEmail}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw CustomException(message: S.current.notSignedIn);
    }

    try {
      await user.verifyBeforeUpdateEmail(newEmail);
      await user.reload();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message ?? S.current.emailUpdateError);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
