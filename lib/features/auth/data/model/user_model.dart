import 'package:commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        email: user.email ?? '', name: user.displayName ?? '', uid: user.uid);
  }
}
