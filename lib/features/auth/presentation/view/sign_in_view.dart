import 'package:commerce_app/core/utlis/service/firebase_auth_servise.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_state.dart';
import 'package:commerce_app/features/auth/presentation/widged/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../data/repo/auth_repo_imp.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        AuthRepoImp(firebaseAuthServise: FirebaseAuthServise()),
      ),
      child: Builder(builder: (context) {
        return BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state is SignInSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم التسجيل بنجاح'),
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignInLoading ,
              child: const SignInBody(),
            );
          },
        );
      }),
    ) ;
  }
}
