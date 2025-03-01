import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServise {
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String pass}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('كلمة المرور المقدمة ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      } else {
        throw Exception('لقد حدث خطأ، يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      throw Exception('لقد حدث خطأ، يرجى المحاولة مرة أخرى.');
    }
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String pass}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('لم يتم العثور على مستخدم لهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw Exception('تم إدخال بريد إلكتروني أو كلمة مرور غير صحيحة .');
      }
    } catch (e) {
      throw Exception('لقد حدث خطأ، يرجى المحاولة مرة أخرى.');
    }
    return null;
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
Future<User?> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();

  if (loginResult.status == LoginStatus.success) {
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    return userCredential.user;
  }

  return null; // في حالة فشل تسجيل الدخول
}

}
