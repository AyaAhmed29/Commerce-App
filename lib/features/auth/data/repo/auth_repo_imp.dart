import 'package:commerce_app/core/errors/failures.dart';
import 'package:commerce_app/core/utlis/service/firebase_auth_servise.dart';
import 'package:commerce_app/features/auth/data/model/user_model.dart';
import 'package:commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';


class AuthRepoImp extends AuthRepo {
  final FirebaseAuthServise firebaseAuthServise;

  AuthRepoImp({required this.firebaseAuthServise});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String pass,
    String name,
  ) async {
    try {
      var user = await firebaseAuthServise.createUserWithEmailAndPassword(
          email: email, pass: pass);
      return right(UserModel.fromFirebaseUser(user!));
    } on Exception {
      return left(ServerFailure('لقد حدث خطأ، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String pass) async {
    try {
      var user = await firebaseAuthServise.signInWithEmailAndPassword(
          email: email, pass: pass);
      return right(UserModel.fromFirebaseUser(user!));
    } on Exception {
      return left(ServerFailure('لقد حدث خطأ، يرجى المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServise.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on Exception {
      return left(ServerFailure('لقد حدث خطأ، يرجى المحاولة مرة أخرى.'));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthServise.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user!));
    } on Exception {
      return left(ServerFailure('لقد حدث خطأ، يرجى المحاولة مرة أخرى.'));
    }
  }
  
}