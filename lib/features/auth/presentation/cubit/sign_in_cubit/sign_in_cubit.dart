import 'package:commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInitial());

  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    emit(SignInLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, pass);

    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
  
  Future<void> signInWithFacebook() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
