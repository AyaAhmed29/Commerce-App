import 'package:commerce_app/core/utlis/service/firebase_auth_servise.dart';
import 'package:commerce_app/features/auth/data/repo/auth_repo_imp.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:commerce_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:commerce_app/features/auth/presentation/widged/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        AuthRepoImp(firebaseAuthServise: FirebaseAuthServise()),
      ),
      child: Builder(builder: (context) {
        return BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم التسجيل بنجاح'),
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignUpLoading ? true : false,
              child: const SignUpBody(),
            );
          },
        );
      }),
    );
  }
}
