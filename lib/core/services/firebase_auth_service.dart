import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} code: ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: "الرقم السري ضعيف جدا");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: "لقد قمت بالتسجيل مسبقا.الرجاء تسجيل الدخول");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException(
            message: "لقد حدث خطأ ما. الرجاء المحاوله مره اخري");
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}");
      throw CustomException(
          message: "لقد حدث خطأ ما. الرجاء المحاوله مره اخري");
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} code: ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: "البريد الالكتروني الرقم السري او غير صحيح");
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: "البريد الالكتروني الرقم السري او غير صحيح");
      }else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: "البريد الالكتروني الرقم السري او غير صحيح");
      }
      else if (e.code == 'network-request-failed') {
        throw CustomException(message: "تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException(
            message: "لقد حدث خطأ ما. الرجاء المحاوله مره اخري");
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}");
      throw CustomException(
          message: "لقد حدث خطأ ما. الرجاء المحاوله مره اخري");
    }
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
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }


  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }
  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential)).user!;
  }
}
