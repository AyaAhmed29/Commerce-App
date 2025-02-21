import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServise {

Future<User?>createUserWithEmailAndPassword(
   {required String email,required String pass}) async {
  
  try {
  final   credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: pass,
  );
  return credential.user; 
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   throw Exception('كلمة المرور المقدمة ضعيفة جدًا.');
  } else if (e.code == 'email-already-in-use') {
   throw Exception('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
  }else{
   throw  Exception('لقد حدث خطأ، يرجى المحاولة مرة أخرى.');
  }
} catch (e) {
  throw Exception('لقد حدث خطأ، يرجى المحاولة مرة أخرى.');
}
}
}