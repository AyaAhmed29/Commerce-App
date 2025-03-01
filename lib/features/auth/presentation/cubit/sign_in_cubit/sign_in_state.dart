import 'package:commerce_app/features/auth/domain/entites/user_entity.dart';

abstract class SignInState {}

class SignInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;
  SignInSuccess(this.user);
}

class SignInFailure extends SignInState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}

