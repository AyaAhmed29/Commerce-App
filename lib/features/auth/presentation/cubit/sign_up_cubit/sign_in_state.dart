import 'package:commerce_app/features/auth/domain/entites/user_entity.dart';

abstract class SignUpState {}

class SignUpitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;
  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}

