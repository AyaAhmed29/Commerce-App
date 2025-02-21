import 'package:commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpitial());
  
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword( String email,
    String pass,
    String name) async {
    emit(SignUpLoading());

    final  result =
        await authRepo.createUserWithEmailAndPassword(email, pass,name);

    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
} 