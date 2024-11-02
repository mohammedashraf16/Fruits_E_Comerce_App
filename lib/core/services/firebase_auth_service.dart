import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      } else if (e.code == 'network-request-failed') {
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
}
