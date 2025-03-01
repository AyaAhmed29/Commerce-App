import 'package:commerce_app/core/errors/failures.dart';
import 'package:commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String pass,
     String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String pass,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle(
    
  );
  Future<Either<Failure, UserEntity>> signInWithFacebook(
    
  );
}
